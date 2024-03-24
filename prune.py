import os
import shutil
import gzip
import json
from tqdm import tqdm

dataset_tokens={
"nfcorpus":167,
"scifact":160,
"arguana":123,
"scidocs":124,
"fiqa":97,
"quora":15,
"trec-covid":122,
"webis-touche2020":156,
"nq":70,
"dbpedia-entity":49,
"hotpotqa":45,
"climate-fever": 69,
"msmarco":50
}

def sort_prune(x,k):
    return dict(sorted(x.items(), key=lambda item: item[1],reverse=True)[:k])

def prune(dataset):
    k = dataset_tokens[dataset] 
    base_directory = os.path.join("beir",dataset,"docs")
    pruned_directory = os.path.join("beir",dataset,"docs_pruned")
    shutil.rmtree(pruned_directory,ignore_errors=True) 
    os.makedirs(pruned_directory,exist_ok=True)
    for filename in tqdm(os.listdir(base_directory)):
        with gzip.open(os.path.join(base_directory, filename), 'rt') as f:
            with gzip.open(os.path.join(pruned_directory, filename), 'wt') as f2:
                for line in f:
                    _dict = json.loads(line)
                    _dict["content"] = ""
                    _dict["vector"] = sort_prune(_dict["vector"],k)
                    f2.write(json.dumps(_dict)+"\n")

# Example usage
parser = argparse.ArgumentParser()
parser.add_argument("dataset", help="first file path")
args = parser.parse_args()
prune(args.dataset)
