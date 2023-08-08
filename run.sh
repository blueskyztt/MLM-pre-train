#!/usr/bin/env bash

set -x
set -euo pipefail

#model="bert-base-chinese"
model="bert-base-uncased"
max_seq_length=100
max_train_steps=30000
validation_split_percentage=10

function train_huggingface_dataset() {
  CUDA_VISIBLE_DEVICES=0 python run_mlm_no_trainer.py \
    --dataset_name "yelp_review_full" \
    --model_name_or_path ${model} \
    --pad_to_max_length \
    --max_seq_length ${max_seq_length} \
    --line_by_line true \
    --per_device_train_batch_size 32 \
    --num_train_epochs 1 \
    --validation_split_percentage ${validation_split_percentage} \
    --output_dir "./pretrain.model" \
    --max_train_steps ${max_train_steps}
}

train_huggingface_dataset
