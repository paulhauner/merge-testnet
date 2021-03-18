# Catalyst Testing Env

This is a scrappy repo which documents the attempts by @paulhauner to get a
Catalyst testnet working.

The `go-ethereum` repo is a submodule, don't forget to initialize it with `git submodule init && git submodule update`.

## Scripts

- [`./init_geth.sh`](./init_geth.sh): initialize Geth via a `genesis.json`
	file.
- [`./make_geth.sh`](./make_geth.sh): build Geth.
- [`./start_get.sh`](./start_geth.sh): start Geth in Catalyst mode.
- [`./rpc_produce_block.sh`](./rpc_produce_block.sh): demonstrates the
	`eth2_produceBlock` RPC call via `curl`. It was used to generate one of the RPC examples.

## Catalyst RPC Examples

### `eth2_produceBlock`

Request:

```json
{
  "jsonrpc": "2.0",
  "method": "eth2_produceBlock",
  "params": [
    {
      "parent_hash": "0x8a42e8e5cc3953e9e99e6d96ac4e1ba7fc86475c59d647d9e9c9dad19bbefee0",
      "randao_mix": "0x0000000000000000000000000000000000000000000000000000000000000000",
      "slot": 1,
      "timestamp": 1615931606,
      "recent_block_roots": [
        "0x0000000000000000000000000000000000000000000000000000000000000000",
        "0x0000000000000000000000000000000000000000000000000000000000000000",
        "0x0000000000000000000000000000000000000000000000000000000000000000",
        "0x0000000000000000000000000000000000000000000000000000000000000000",
        "0x0000000000000000000000000000000000000000000000000000000000000000",
        "0x0000000000000000000000000000000000000000000000000000000000000000",
        "0x0000000000000000000000000000000000000000000000000000000000000000",
        "0x0000000000000000000000000000000000000000000000000000000000000000"
      ]
    }
  ],
  "id": 67
}
```

Response:

```json
{
  "jsonrpc": "2.0",
  "id": 67,
  "result": {
    "coinbase": "0x0000000000000000000000000000000000000001",
    "state_root": "0x93678708cecbe15acf5bd571e4519689a40a1b2290864bb84a661f31c0580116",
    "gas_limit": 3141592,
    "gas_used": 0,
    "transactions": null,
    "receipt_root": "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
    "logs_bloom": "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",
    "block_hash": "0x8c1badd71dea3f4ea28f8b4a2c63b24cc5ef9a8a455d7ef21c98c85be8782026",
    "parent_hash": "0x8a42e8e5cc3953e9e99e6d96ac4e1ba7fc86475c59d647d9e9c9dad19bbefee0",
    "difficulty": 131072
  }
}
```

## Links

- [Mikhail's "The Merge" PR](https://github.com/ethereum/eth2.0-specs/pull/2229)
- [ethresear.ch merge post](https://ethresear.ch/t/executable-beacon-chain/8271)
- [Catalyst RPC endpoints](https://hackmd.io/@n0ble/eth1-eth2-communication-protocol-draft)
- [Catalyst code](https://github.com/gballet/go-ethereum/tree/catalyst-for-executable-beacon-chai-rebased)
	(branch is the latest as of 2021/03/17)
- [Geth standard RPC API](https://eth.wiki/json-rpc/API)
