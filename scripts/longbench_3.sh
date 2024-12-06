cd evaluation/LongBench

model="longchat-v1.5-7b-32k"

# python -u pred.py \
#     --model $model --task $task

# for budget in 512 1024 2048 4096
for task in "qasper" "narrativeqa" "hotpotqa" "multifieldqa_en" "gov_report" "triviaqa"
do
    for page_size in 4 8
    do
        for budget in 256
        do
            CUDA_VISIBLE_DEVICES=6,7 python -u pred.py \
                --model $model --task $task \
                --quest --token_budget $budget --chunk_size $page_size
        done
    done
done

# python -u eval.py --model $model