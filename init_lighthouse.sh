#!/usr/bin/env bash

#
# Produces a testnet specification and a genesis state where the genesis time
# is now.
#

source ./vars.env

$LCLI_PATH \
	--spec mainnet \
	new-testnet \
	--deposit-contract-address 1234567890123456789012345678901234567890 \
	--testnet-dir $LH_TESTNET_DIR \
	--min-genesis-active-validator-count $VALIDATOR_COUNT \
	--force

echo Specification generated at $LH_TESTNET_DIR.
echo "Generating $VALIDATOR_COUNT validators concurrently... (this may take a while)"

$LCLI_PATH \
	insecure-validators \
	--count $VALIDATOR_COUNT \
	--validators-dir $LH_VALIDATORS_DIR \
	--secrets-dir $LH_SECRETS_DIR

echo Validators generated at $LH_VALIDATORS_DIR with keystore passwords at $LH_SECRETS_DIR.
echo "Building genesis state... (this might take a while)"

$LCLI_PATH \
	--spec mainnet \
	interop-genesis \
	--testnet-dir $LH_TESTNET_DIR \
	$VALIDATOR_COUNT

echo Created genesis state in $LH_TESTNET_DIR
