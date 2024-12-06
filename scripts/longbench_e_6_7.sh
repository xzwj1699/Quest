cd evaluation/LongBench

model="longchat-v1.5-7b-32k"

# python -u pred.py \
#     --model $model --task $task

# for budget in 512 1024 2048 4096
for page_size in 16
do
    for budget in 512
    do
        CUDA_VISIBLE_DEVICES=6,7 python -u pred.py \
            --model $model \
            --quest --token_budget $budget --chunk_size $page_size --e
    done
done

# python -u eval.py --model $model