#!/bin/bash --login
# The --login ensures the bash configuration is loaded,
# enabling Conda.
set -euo pipefail
conda activate dev_fileserver
exec uvicorn test_fastapi:app --host 0.0.0.0 --port 4557 --reload