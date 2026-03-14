if command -v docker >/dev/null 2>&1; then
    DOCKERCMD="docker"
elif command -v podman >/dev/null 2>&1; then
    DOCKERCMD="podman"
else
    echo "No container engine found. Please install Docker or Podman." >&2
    exit 1
fi
$DOCKERCMD run -it --rm pldi26:memo /bin/bash
