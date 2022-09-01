#!/bin/sh
set -e

exec uvicorn cyberapk:server --host 0.0.0.0 --port 8085 --workers 4