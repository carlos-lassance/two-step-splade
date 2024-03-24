# two-step-splade

This is the code for the Two-Step SPLADE paper (https://www.springerprofessional.de/en/two-step-splade-simple-efficient-and-effective-approximation-of-/26866450). There is two ways of using this code: Either you can replicate our results using our precomputed indexes or you can reproduce it by generating the indexes.

## Replicating Results

1. Download all index and query files from: 
2. Install pisa (from our folder)
3. Run the desired table line (method #) for each dataset (example run_line)
4. Aggregate results

## Reproduce

1. Install all submodules (including our pisa)
2. Generate anserini files with run_splade.sh
3. Count tokens with token_count.py
4. Index files with index.sh
5. Convert to pisa with convert_pisa.sh
6. Generate reorder file with reorder.py
7. Generate reorder index with reorder.sh
8. Run the desired table line (method #) for each dataset (example run_line)
9. Aggregate results

## Issues or problems

Feel free to create a new issue or to send me an email directly (cadurosar@gmail.com)

## Cite

```
@inproceedings{lassance2024two,
  title={Two-Step SPLADE: Simple, Efficient and Effective Approximation of SPLADE},
  author={Lassance, Carlos and Dejean, Herv{\'e} and Clinchant, St{\'e}phane and Tonellotto, Nicola},
  booktitle={European Conference on Information Retrieval},
  pages={349--363},
  year={2024},
  organization={Springer}
}
```
