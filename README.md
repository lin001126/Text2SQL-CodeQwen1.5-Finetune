# DTS-SQL with CodeQwen1.5: Text2SQL Implementation

This project uses CodeQwen1.5, fine-tuned in a DTS-SQL approach, and performs inference with VLLM to implement a text-to-SQL generation pipeline. Here's how to set up and use this project.


## Installation

First, clone the repository from GitHub:

```bash
git clone https://github.com/MohammadrezaPourreza/DTS-SQL/tree/main
cd DTS-SQL
```

Install the necessary dependencies:

```bash
pip install -U accelerate bitsandbytes peft transformers==4.39 datasets trl git-lfs wandb flash-attn sql-metadata scipy sqlglot
```

**Note**: Avoid using \`transformers==4.40\` as it leads to errors with CodeQwen.

## Data Preparation
To set up the dataset for this project, follow these steps:

1. Download the dataset from [Google Drive](https://drive.google.com/drive/folders/1P3d0NUa3k27GqpQ6b_aPDT8dpNubuQ9u?usp=sharing).

2. Unzip the downloaded file if it is compressed.

3. Place the unzipped dataset folder into the `spider` directory at the root of this project.

This project utilizes the Spider 1.0 dataset, which can be found on the [Spider dataset website](https://yale-lily.github.io/spider).

Alternatively, you can skip the script execution and directly download the pre-built datasets:

- [Training](https://drive.google.com/drive/folders/1PyePgaeVY2QnYJ8v-E_ImsMVoN7fEFL0?usp=sharing)
- [Validation](https://drive.google.com/drive/folders/1TH8geYF4vYMgLe7Eu9QBdk18bnKuUTQA?usp=sharing)

These links contain all the necessary files to get started with the project.

If you dont't want to download, o prepare the training and validation datasets, you have the option to use the provided scripts. Please note that you may need to adjust the dataset paths in the scripts accordingly.

```bash
python finetuning_dataset_creator.py
```

The file with 'filtered' in its name contains the ideal results (directly extracted information from SQL answers).

## Fine-tuning and Inference

### Stage 1: Schema Linking
1. Execute the Jupyter notebook for schema linking fine-tuning:
   ```bash
   jupyter notebook schema_linking_generation_finetuning.ipynb
   ```
2. Run the inference notebook:
   ```bash
   jupyter notebook schema_linking_generation_inference.ipynb
   ```
   The output of this step is a trained model capable of extracting potentially relevant table names from a given question and its related database schema.

### Stage 2: SQL Generation
1. Train the SQL generation model:
   ```bash
   jupyter notebook sql_generation_finetuning.ipynb
   ```
2. Perform inference to generate SQL queries:
   ```bash
   jupyter notebook sql_generation_inference.ipynb
   ```
   For an upperbound result, replace the file \`generated_test_schema_links.csv\` with \`./validation/filtered_spider_syn_dataset.csv\` in the inference notebook.

The output of this step will be the final checkpoint for the first stage LoRA layer and the stage1 model's inference results on the test set (`final_checkpoint_part1`). Additionally, `data_processing_scheme2inference.py` is integrated to generate the data (`useful_val_dataset1.csv`) used for final SQL generation inference.

## Batch Execution

Run the batch script to execute all notebooks automatically:

```bash
sh run.sh
```

## Using VLLM for Faster Inference

For faster inference, you can use the VLLM model by running:

```bash
jupyter notebook inference_vllm.ipynb
```

Note: The results with VLLM may not be as accurate as with the fully fine-tuned models.

## Models

Download the required models from the following links:
- Stage 1 LoRA model: [Google Drive](https://drive.google.com/drive/folders/18CIieOfKysGdTGt42nacuwj_QBpydO4R?usp=sharing)
- Stage 2 LoRA model: [Google Drive](https://drive.google.com/drive/folders/10MpdYQli0sYhpOQAxJvfBCgBwmuToIyI?usp=sharing)
- Stage 1 trained model: [Hugging Face](https://huggingface.co/zjj815/codeqwen-7b-schema)
- Stage 2 trained model: [Hugging Face](https://huggingface.co/zjj815/codeqwen-7b-sql)

## Results

Evaluation on Spider (https://yale-lily.github.io/spider)

Expected results are:
- Exact Match (EM): 0.736
- Execution Accuracy (EX): 0.813
- Upperbound result: 0.876 with ideal data setup
