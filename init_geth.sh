source ./vars.env

$GETH_BINARY \
	init \
	./genesis.json \
	--datadir $GETH_DATADIR
