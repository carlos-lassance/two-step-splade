for dataset in arguana
do
    cd beir/$dataset/docs
    split docs_anserini.jsonl
    rm docs_anserini.jsonl
    cd ../../../
done