set -x
python app.py &
sleep 1
echo $! > .pidfile
set +x
