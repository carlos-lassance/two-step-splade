export dataset=$1
python reorder.py $dataset
pisa/build/bin/reorder-docids \
    --collection /home/carlos_cohere_com/two-step/pisa-canonical/$dataset/full/full \
    --output /home/carlos_cohere_com/two-step/pisa-canonical/$dataset/full/reorder \
    --from-mapping /home/carlos_cohere_com/two-step/pisa-canonical/$dataset/reorder

./pisa/build/bin/compress_inverted_index --encoding block_simdbp --collection pisa-canonical/$dataset/full/reorder --output pisa-index/$dataset/full/reorder.block_simdbp.idx
