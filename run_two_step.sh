export dataset=$1

mkdir -p runs_pisa/$dataset
mkdir -p results_pisa/$dataset/
mkdir -p latencies_pisa/$dataset/

./pisa/build/bin/two_step_evaluate_queries \
                                   --encoding block_simdbp \
                                   --documents /home/carlos_cohere_com/two-step/pisa-canonical/$dataset/pruned/pruned.docmap \
                                   --index pisa-index/$dataset/pruned/block_simdbp.idx \
                                   --index2 pisa-index/$dataset/full/reorder.block_simdbp.idx \
                                   --wand pisa-index/$dataset/pruned/quantized-40.bmw \
                                   --algorithm maxscore \
                                   -k 100 \
                                   --scorer quantized \
                                   --weighted \
                                   --queries pisa-index/$dataset/pruned/pruned_queries.pisa.ints \
                                   --queries2 pisa-index/$dataset/full/full_queries.pisa.ints \
                                   --run "bp-spladev2" > runs_pisa/$dataset/two_step.trec

ir_measures qrels/qrels.beir-v1.0.0-$dataset.test.txt runs_pisa/$dataset/two_step.trec nDCG@10 > results_pisa/$dataset/two_step.trec
cat results_pisa/$dataset/two_step.trec

 ./pisa/build/bin/two_step_queries \
                             --encoding block_simdbp \
                             --index pisa-index/$dataset/pruned/block_simdbp.idx \
                             --index2 pisa-index/$dataset/full/reorder.block_simdbp.idx \
                             --wand pisa-index/$dataset/pruned/quantized-40.bmw \
                             --algorithm maxscore \
                             -k 100 \
                             --weighted \
                             --scorer quantized \
                             --queries pisa-index/$dataset/pruned/pruned_queries.pisa.ints \
                             --queries2 pisa-index/$dataset/full/full_queries.pisa.ints > latencies_pisa/$dataset/two_step.trec

cat latencies_pisa/$dataset/two_step.trec                            
