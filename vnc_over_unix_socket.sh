if [[ $# -eq 0 ]]; then
	echo "Pass unix file path"
	exit
fi

if [[ ! -e $1 ]]; then
	echo "File does not exists"
	exit
fi

PORT=5900
echo $#
if [[ $# -eq 2 ]]; then
	PORT=$2
fi
echo $PORT
socat TCP-LISTEN:$PORT,reuseaddr,fork UNIX-CLIENT:$1 & krdc vnc://localhost:$PORT
