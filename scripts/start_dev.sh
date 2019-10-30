set -x
#python app.py &
flask run --host=0.0.0.0
sleep 1
echo $! > .pidfile
set +x
