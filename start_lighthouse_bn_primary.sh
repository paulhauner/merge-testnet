source ./vars.env

$LIGHTHOUSE_BINARY \
	--testnet-dir $LH_TESTNET_DIR \
	--debug-level $LH_DEBUG_LEVEL \
	bn \
	--datadir $LH_PRIMARY_BN_DATADIR \
	--http \
	--metrics \
	--dummy-eth1 \
	--enr-address 127.0.0.1 \
	--enr-udp-port 9000 \
	--enr-tcp-port 9000 \
