# Stop any running container
RUNNING_CONTAINER_PATH="$PROJECT_CWD/.running"
if [ -f "$RUNNING_CONTAINER_PATH" ];
then
    docker stop $(head -n 1 "$PROJECT_CWD/.running") &> null
    rm "$RUNNING_CONTAINER_PATH"
fi

# Get current version
VERSION_NUMBER=$(head -n 1 "$PROJECT_CWD/VERSION")
VERSION_NUMBER=${VERSION_NUMBER:-"latest"}

if [ "$2" == "--prod" ];
then
    VERSION_TAG="$VERSION_NUMBER""-prod"
    echo "Run production image: $HUMBLE_REPO:$VERSION_TAG"
    echo "(\"humble halt\" to stop)"
    CONTAINER_ID=$(docker run -d --rm -p "$HUMBLE_PORT:80" "$HUMBLE_REPO:$VERSION_TAG")
elif [ "$2" == "--dev" ];
then
    VERSION_TAG="$VERSION_NUMBER""-dev"
    echo "Run development image: $HUMBLE_REPO:$VERSION_TAG"
    echo "(\"humble halt\" to stop)"
    CONTAINER_ID=$(docker run -d --rm -p "$HUMBLE_PORT:80" "$HUMBLE_REPO:$VERSION_TAG")
else
    echo "Run development setup with linked volumes:"
    echo "(\"humble halt\" to stop)"
    CONTAINER_ID=$(docker run -d --rm -p "$HUMBLE_PORT:80" -v "$PROJECT_CWD/services/web/src:/usr/share/nginx/html" nginx:1.13)
fi

# Dump running container into temporary file
echo $CONTAINER_ID > "$PROJECT_CWD/.running"
