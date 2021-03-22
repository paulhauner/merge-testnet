source ./vars.env

echo "Generating bootnode enr"

$LCLI_BINARY \
	generate-bootnode-enr \
	--ip 127.0.0.1 \
	--udp-port $BOOTNODE_PORT \
	--tcp-port $BOOTNODE_PORT \
	--genesis-fork-version $GENESIS_FORK_VERSION \
	--output-dir $LH_BOOT_DATADIR

bootnode_enr=`cat $LH_BOOT_DATADIR/enr.dat`
echo "- $bootnode_enr" > $LH_TESTNET_DIR/boot_enr.yaml

echo "Generated bootnode enr and written to $LH_TESTNET_DIR/boot_enr.yaml"

DEBUG_LEVEL=${1:-info}

echo "Starting bootnode"

exec lighthouse boot_node \
    --testnet-dir $LH_TESTNET_DIR \
    --port $BOOTNODE_PORT \
    --listen-address 127.0.0.1 \
    --network-dir $LH_BOOT_DATADIR \
