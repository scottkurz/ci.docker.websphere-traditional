PID=

start_server()
{
    if [ -z "$PID" ]; then 
        PID=$(ps -C java -o pid= | tr -d " ")
        echo "Starting server ..................."
        /opt/IBM/WebSphere/AppServer/profiles/$PROFILE_NAME/bin/startServer.sh $SERVER_NAME
    fi
}

stop_server()
{
    if [ ! -z "$PID" ]; then 
        echo "Stopping server ..................."
        kill -s INT $PID
    fi
}

run_script()
{
    /work/run_py_script.sh $1
}

echo "Updating Password"
/work/modify_password.sh

echo "Applying configuration"
if [ ! -z "$1" ]; then
    start_server
    /work/run_py_script.sh "$@"
elif [ ! -z "$(ls /work/config)" ]; then
    echo "+ Found config-files under /work/config. Executing..."
    for script in $(find /work/config -name "*.py"); do
        start_server
        /work/run_py_script.sh $script
    done
fi
work/applyConfig.sh
stop_server
