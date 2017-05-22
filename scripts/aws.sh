# Connect to AWS instance

CONNECT_CMD="ssh -i $EC2_PEM -t $EC2_USR""@""$EC2_DNS \"cd $EC2_CWD ; bash\""
echo "$CONNECT_CMD"
eval "$CONNECT_CMD"
