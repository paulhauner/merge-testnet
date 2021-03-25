source ./vars.env

$GETH_BINARY \
	account \
	new \
	--datadir $GETH_DATADIR \
	--password password.txt
