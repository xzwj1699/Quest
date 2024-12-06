cd evaluation/LongBench

model="longchat-v1.5-7b-32k"

# python -u pred.py \
#     --model $model --task $task

# for budget in 512 1024 2048 4096
for task in "qasper" "lcc" "passage_retrieval_en"
do
    for page_size in 32
    do
        for budget in 128
        do
            CUDA_VISIBLE_DEVICES=2,3 python -u pred.py \
                --model $model --task $task \
                --quest --token_budget $budget --chunk_size $page_size
        done
    done
done

# python -u eval.py --model $model