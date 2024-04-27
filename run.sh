
notebooks=(schema_linking_generation_finetuning.ipynb schema_linking_generation_inference.ipynb sql_generation_finetuning.ipynb sql_generation_inference.ipynb)

for notebook in "${notebooks[@]}"
do
  echo "running $notebook ..."
  papermill "$notebook" "output_${notebook}" -k dbgpt_hub --log-output --execution-timeout -1
  echo "$notebook finished。"
done

echo "all finished。"


