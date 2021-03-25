# Catalyst Testing Env

This is a scrappy repo which documents the attempts by @paulhauner to get a
Catalyst testnet working.

The `go-ethereum` repo is a submodule, don't forget to initialize it with `git submodule init && git submodule update`.

The Lighthouse branch used with this code is at https://github.com/paulhauner/lighthouse/tree/merge-v1

## Scripts

- [`./init_geth.sh`](./init_geth.sh): initialize Geth via a `genesis.json`
	file.
- [`./make_geth.sh`](./make_geth.sh): build Geth.
- [`./start_get.sh`](./start_geth.sh): start Geth in Catalyst mode.
- [`./rpc_produce_block.sh`](./rpc_produce_block.sh): demonstrates the
	`eth2_produceBlock` RPC call via `curl`. It was used to generate one of the RPC examples.

## How to run the setup

**This setup is not intended for users**, it's for development purposes only.
It's not at all user-friendly because there's nothing to gain from users
running it.

First, initialize the setup with:

```bash
make
./make_geth.sh
```

Also, ensure you have the `lighthouse` and `lcli` binaries in your path running
the correct branch (see above).

Then, start five terminals and run the following scripts in each one of them:

1. `./start_geth.sh`
1. `./start_lighthouse_boot_node.sh`
1. `./start_lighthouse_bn_secondary.sh`
1. `./start_lighthouse_bn_primary.sh`
1. `./start_lighthouse_vc.sh`

If you want to make a transaction you can import the
[keystore](./UTC--2021-03-23T13-21-47.105246171Z--c4c4cb1a9dd13fd87daa46e489c08885e567f4ea)
in the root directory into Metamask. The password is `hi_mum`. Of course, don't
store anything valuable in this keystore; it's completely insecure. Metamask
will need the chain id, you can find it in [`genesis.json`](./genesis.json).

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
    "state_root": "0xc3095c9894c8f71b9f0730b3bc071c6414e7510dc14458599b49b5734345008f",
    "gas_limit": 3141592,
    "gas_used": 21000,
    "transactions": [
      {
        "nonce": "0x0",
        "gasPrice": "0x3b9aca00",
        "gas": "0x5208",
        "to": "0x25c4a76e7d118705e7ea2e9b7d8c59930d8acd3b",
        "value": "0x0",
        "input": "0x",
        "v": "0x2e9356953b",
        "r": "0x5d640e947ab33bc3d47a067765115dd31e46fb5b5dcfa68db68e5dded9bdcd05",
        "s": "0x1922e21a732ab6bc9332105a4d758c5a35521ca0535ac6d5958120ab866c3195",
        "hash": "0xc67add5be7392507b15eef85a9d2794ec07a38daea32a827c07e5a6c534a65aa"
      }
    ],
    "receipt_root": "0x056b23fbba480696b65fe5a59b8f2148a1299103c4f57df839233af2cf4ca2d2",
    "logs_bloom": "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",
    "block_hash": "0xbf94b00f0d9c86f02b6f66626ea284aea9ef8417a7d0c33596121db0a653c755",
    "parent_hash": "0xddce9c6ed083fc7daf708d0c4ed4fc73320a4c0b752929d677f70461266acc4d",
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
