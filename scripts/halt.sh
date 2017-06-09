# Stop any running container
RUNNING_CONTAINER_PATH="$PROJECT_CWD/.running"
if [ -f "$RUNNING_CONTAINER_PATH" ];
then
    docker stop $(head -n 1 "$PROJECT_CWD/.running") &> null
    rm "$RUNNING_CONTAINER_PATH"
fi
