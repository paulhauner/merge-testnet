source ./vars.env

$LIGHTHOUSE_BINARY \
	--testnet-dir $LH_TESTNET_DIR \
	--debug-level $LH_DEBUG_LEVEL \
	vc \
	--init-slashing-protection \
	--datadir $LH_PRIMARY_BN_DATADIR \
	--http \
	--metrics \
