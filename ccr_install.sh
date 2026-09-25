#!/bin/bash
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
mkdir output

echo "#!/bin/bash
brew install uv -y
cd \"$SCRIPT_DIR\"
git pull
uv sync
uv run create_change_request.py
" | sudo tee ccr.sh
chmod +x ccr.sh

sudo ln -sf "$SCRIPT_DIR/ccr.sh" /usr/local/bin/ccr

