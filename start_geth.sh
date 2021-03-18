source ./vars.env

$GETH_BINARY \
	--catalyst \
	--miner.etherbase 0x0000000000000000000000000000000000000001 \
	--datadir $GETH_DATADIR \
	--http \
	--http.api eth2,eth \
