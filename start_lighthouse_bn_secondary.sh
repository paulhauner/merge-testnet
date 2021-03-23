source ./vars.env

$LIGHTHOUSE_BINARY \
	--testnet-dir $LH_TESTNET_DIR \
	--debug-level $LH_DEBUG_LEVEL \
	bn \
	--datadir $LH_SECONDARY_BN_DATADIR \
	--eth1-endpoints $GETH_LISTEN \
	--http \
	--metrics \
	--zero-ports
