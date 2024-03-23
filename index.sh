for dataset in arguana
do
    java -cp anserini-0.24.1-fatjar.jar io.anserini.index.IndexCollection \
    -collection JsonVectorCollection \
    -input beir/$dataset/docs \
    -index anserini_indexes/full/$dataset/ \
    -generator DefaultLuceneDocumentGenerator \
    -threads 9 -impact -pretokenized -optimize
done