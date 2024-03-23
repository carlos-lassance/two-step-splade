for dataset in arguana
do
    mkdir runs/$dataset
    mkdir -p results/$dataset
    java -cp anserini-0.24.1-fatjar.jar io.anserini.search.SearchCollection \
        -index anserini_indexes/full/$dataset/ \
        -topics beir/$dataset/queries_anserini.tsv \
        -topicReader TsvString \
        -output runs/$dataset/full.txt -format trec \
        -parallelism 16 \
        -impact -pretokenized -hits 1000 -removeQuery
    ir_measures qrels/qrels.beir-v1.0.0-$dataset.test.txt runs/$dataset/full.txt nDCG@10 > results/$dataset/full
    echo "Results $dataset"
    cat results/$dataset/full

done