import pandas as pd
from tqdm import tqdm
from utils.database_formatter import get_table_schema_with_samples, get_all_table_names
from utils.sql_regularizator import format_and_lowercase_sql_query
from utils.prompts import (
    sql_generation_prompt_token_counter,
    schema_linking_prompt_token_counter,
)
from transformers import AutoTokenizer
from sql_metadata import Parser

BASE_DATABASES_DIR = "./spider/test_database"
MODEL_NAME = "./model/CodeQwen7B/Qwen/CodeQwen1___5-7B"
CONTEXT_WINDOW = 3000
tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME)


def create_sql_generation_correct_tables(dataset, question, query, db_uri, correct_tables):
    correct_columns = Parser(query).columns
    database_schema_filtered = ""
    #print(correct_tables)
    for table in reversed(correct_tables.split(",")):
        #print(table)
        database_schema_filtered += get_table_schema_with_samples(db_uri, table)
        database_schema_filtered += "\n"
    database_schema = ""
    all_tables = get_all_table_names(db_uri)
    for table in all_tables:
        database_schema += get_table_schema_with_samples(db_uri, table)
        database_schema += "\n"
    if (
        schema_linking_prompt_token_counter(question, database_schema, correct_tables, correct_columns, tokenizer)
        <= CONTEXT_WINDOW
    ):
        dataset.append(
            {
                "db_id": db_uri.split("/")[-1].split(".")[0],
                "question": question,
                "query": query,
                "filtered_database_schema": database_schema_filtered,
                "database_schema": database_schema,
                "correct_tables": ", ".join(correct_tables),
                "correct_columns": ", ".join(correct_columns),
            }
        )
    return dataset

def load_spider_dev_set():
    df = pd.read_csv("/hpc2hdd/home/ychen151/DTS-SQL/generated_test_schema_links.csv")
    df.iloc[:, :1] = df.iloc[:, :1].apply(lambda x: x.str.replace(' ', ''), axis=1)
    return df

if __name__ == "__main__":
    # Load Spider dev set
    df = load_spider_dev_set()
    filtered_finetuning_dataset = []
    for index, row in tqdm(df.iterrows(), total=len(df)):
        db_id = row["db_id"]
        question = row["question"]
        query = row["query"]
        correct_tabs=row["predicted_tables"]
        #print(correct_tabs)
        formatted_query = format_and_lowercase_sql_query(query)
        db_uri = f"{BASE_DATABASES_DIR}/{db_id}/{db_id}.sqlite"
        filtered_validation_dataset = create_sql_generation_correct_tables(
            filtered_finetuning_dataset, question, formatted_query, db_uri, correct_tabs
        )
    filtered_validation_dataset = pd.DataFrame(filtered_validation_dataset)
    filtered_validation_dataset.to_csv('useful_val_dataset1.csv')
