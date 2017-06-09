
# Get current version
VERSION_NUMBER=$(head -n 1 "$PROJECT_CWD/VERSION")
VERSION_NUMBER=${VERSION_NUMBER:-"latest"}

if [ "$2" == "--prod" ]
then
    VERSION_TAG="$VERSION_NUMBER""-prod"
else
    VERSION_TAG="$VERSION_NUMBER""-dev"
fi

echo "Releasing $HUMBLE_REPO:$VERSION_TAG""..."
docker build -t "$HUMBLE_REPO:$VERSION_TAG" ./services/web
docker push "$HUMBLE_REPO:$VERSION_TAG"
