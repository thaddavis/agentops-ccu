#!/bin/bash
set -e

./start_all.sh
./novnc_startup.sh

# python http_server.py > /tmp/server_logs.txt 2>&1 &
# STREAMLIT_SERVER_PORT=8501 python -m streamlit run computer_use_demo/streamlit.py > /tmp/streamlit_stdout.log &

# Start the HTTP server and stream logs to console
python http_server.py &
# Start Streamlit server and stream logs to console
STREAMLIT_SERVER_PORT=8501 python -m streamlit run computer_use_demo/streamlit.py &

echo "✨ Computer Use Demo is ready!"
echo "➡️  Open http://localhost:8080 in your browser to begin"

# Keep the container running
tail -f /dev/null