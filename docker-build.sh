if command -v docker >/dev/null 2>&1; then
    DOCKERCMD="docker"
elif command -v podman >/dev/null 2>&1; then
    DOCKERCMD="podman"
else
    echo "No container engine found. Please install Docker or Podman." >&2
    exit 1
fi
$DOCKERCMD build -t pldi26:memo -f Dockerfile .
