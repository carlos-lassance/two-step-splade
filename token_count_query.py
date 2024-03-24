import ir_datasets
import os
import shutil
import gzip
import json
from transformers import AutoTokenizer
from tqdm import tqdm
import numpy as np

tokenizer = AutoTokenizer.from_pretrained("bert-base-uncased")
for dataset in ["nfcorpus/test",
"scifact/test",
"arguana",
"scidocs",
"fiqa/test",
"quora/test",
"trec-covid",
"webis-touche2020/v2",
"nq",
"dbpedia-entity/test",
"hotpotqa/test",
"climate-fever",
"fever/test",
"msmarco/dev"
               ]:
    lengths = list()
    datasets = ir_datasets.load("beir/{}".format(dataset))
    for query in datasets.queries_iter():    
        local_lengths = tokenizer(query.text).input_ids
        local_lengths = len(set(local_lengths))
        lengths.append(local_lengths)
    print(dataset, np.mean(lengths))