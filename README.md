# Continuing pre-training of the MLM model

In natural language processing (NLP), using an open source pre-trained model and continuing to pre-train it helps to
improve the generalization ability and adaptability of the model, making the model perform better on specific tasks.

The method of continuing pre-training is basically the same as the pre-training method, that is, using unlabeled data to
generate labels by designing self-supervised tasks. For example, masked language modeling (MLM) tasks using language
models, where the model needs to predict masked words from context.

Continuing pre-training uses existing pre-trained models to continue learning these self-supervised tasks. The data is
generally taken from data sets that are highly related to downstream tasks for training, rather than pursuing
versatility.

## 1. Create a new Notebook Server

Create a new Notebook Server on the Kubeflow on vSphere platform.

- You can create your own custom image or use an image published by us here:

  `projects.registry.vmware.com/models/notebook/inference:nlp-pytorch-gpu-v4`
- set 8 CPUs, 6GB memory, 1 GPU for this Notebook Server.

## 2. Connect to the Notebook Server

Open a Terminal window. Pull the code of this project by running

`git clone https://github.com/blueskyztt/MLM-pre-train.git`

## 3. Prepare

Install required dependencies

```shell
pip install -r requirements.txt
```

## 4. Data

`datasets` is a dataset management tool produced by huggingface, which can be installed with `pip`:

```shell
pip install datasets
```

`datasets` has built-in a large number of open source datasets, including squad,
yelp-review, etc., no need to download in advance in this project, `run_mlm_no_trainer.py` already includes the download
process.

## 5. Continuing pre-training

The python script is
from: https://github.com/huggingface/transformers/blob/main/examples/pytorch/language-modeling/run_mlm_no_trainer.py

To continue pre-training, simply execute

```shell
bash run.sh
```

Among them, [run.sh](run.sh) supports the continuing pre-training of `datasets` data (`train_huggingface_dataset`).

## 6. Model output

After training, the pre-trained model will be saved in the specified directory, such as `./pretrain.model`, which can be
used for other NLP tasks.