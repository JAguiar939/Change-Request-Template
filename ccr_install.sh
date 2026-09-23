#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
mkdir output
echo "#!/bin/bash
brew install uv -y
cd $SCRIPT_DIR
git pull
uv run create_change_request.py
" | sudo tee /usr/local/bin/ccr
sudo chmod +x /usr/local/bin/ccr
