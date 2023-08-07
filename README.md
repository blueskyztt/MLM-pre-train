# Continuing pre-training of the MLM model

## Introduction to continuing pre-training

In natural language processing (NLP), using an open source pre-trained model and continuing to pre-train it helps to
improve the generalization ability and adaptability of the model, making the model perform better on specific tasks.

The method of continuing pre-training is basically the same as the pre-training method, that is, using unlabeled data to
generate labels by designing self-supervised tasks. For example, masked language modeling (MLM) tasks using language
models, where the model needs to predict masked words from context.

Continuing pre-training uses existing pre-trained models to continue learning these self-supervised tasks. The data is
generally taken from data sets that are highly related to downstream tasks for training, rather than pursuing
versatility.

## Prepare

Install required dependencies

```shell
pip install -r requirements.txt
```

## Data

`datasets` is a dataset management tool produced by huggingface, which can be installed with `pip`:

```shell
pip install datasets
```

`datasets` has built-in a large number of open source datasets, including squad,
yelp-review, etc., no need to download in advance in this project, `run_mlm_no_trainer.py` already includes the download
process.

## Continuing pre-training

The python script is
from: https://github.com/huggingface/transformers/blob/main/examples/pytorch/language-modeling/run_mlm_no_trainer.py

To continue pre-training, simply execute

```shell
bash run.sh
```

Among them, [run.sh](run.sh) supports the continuing pre-training of `datasets` data (`train_huggingface_dataset`).

## Model output

After training, the pre-trained model will be saved in the specified directory, such as `./pretrain.model`, which can be
used for other NLP tasks.