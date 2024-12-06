# BUDGET_POOL=('512' '1024' '2048' '4096' '102400') # 102400 is full cache version
# BUDGET_POOL=('64' '128' '256' '512') # 102400 is full cache version
# CONTEXT_POOL=('1000' '2000' '4000' '8000' '16000' '32000') # 102400 is full cache version
# Define pairs of (budget, context)
PAIRS=(
    # '256 1000'
    # '256 2000'
    # '256 4000'
    # '256 8000'
    # '256 16000'
    # '256 32000'
    '704 7000'
)
# PAIRS=(
#     # '1024 1000'
#     # '1024 2000'
#     # '1024 4000'
#     # '1024 8000'
#     # '1024 16000'
#     # '1024 32000'
# )

PAGE_SIZE=('16')

for pair in "${PAIRS[@]}"
do
    # Split the pair into budget and context
    read -r budget context <<< "$pair"
    
    for page in "${PAGE_SIZE[@]}"
    do
        # nsys profile python3 bench_textgen.py --context_len $context --decode_len 32 --token_budget $budget --iteration 20 --page_size $page --model longchat
        python3 bench_textgen.py --context_len $context --decode_len 32 --token_budget $budget --iteration 20 --page_size $page --model longchat
    done
done
