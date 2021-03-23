PARAMS='["earliest", false]'
DATA="{\"jsonrpc\":\"2.0\",\"method\":\"eth_getBlockByNumber\",\"params\":$PARAMS,\"id\":67}"

curl \
	-X \
	POST \
	-H "Content-Type: application/json" \
	--data "$DATA" \
	http://localhost:8545 \
	| \
	jq -r '.result.hash' \
	| \
	cut -c 3-
