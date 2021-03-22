#!/usr/bin/env bash

# is now.
#

source ./vars.env

$LCLI_BINARY \
	--spec mainnet \
	new-testnet \
	--deposit-contract-address 1234567890123456789012345678901234567890 \
	--testnet-dir $LH_TESTNET_DIR \
	--genesis-fork-version $GENESIS_FORK_VERSION \
	--min-genesis-active-validator-count $VALIDATOR_COUNT \
	--force

echo Specification generated at $LH_TESTNET_DIR.
echo "Generating $VALIDATOR_COUNT validators concurrently... (this may take a while)"

$LCLI_BINARY \
	insecure-validators \
	--count $VALIDATOR_COUNT \
	--base-dir $LH_PRIMARY_BN_DATADIR

echo Validators generated at $LH_PRIMARY_BN_DATADIR.
echo "Building genesis state... (this might take a while)"

$LCLI_BINARY \
	--spec mainnet \
	interop-genesis \
	--testnet-dir $LH_TESTNET_DIR \
	$VALIDATOR_COUNT

echo Created genesis state in $LH_TESTNET_DIR
