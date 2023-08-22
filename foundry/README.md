## Foundry Commands

**Deploy**

```
 forge script script/<SmartContract>.s.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY
```

**Verify**

```
 forge verify-contract <contract_address> <SmartContractName> --watch --chain-id <your_rpc_chain_id>
```

**Call Smart Contract with Transaction**

```
 cast send <contract_address> "<method_name>(<params>)" <value_params> --rpc-url $RPC_URL --private-key $PRIVATE_KEY
```

**Call Smart Contract with Call**

```
 cast call <contract_address> "<method_name>(<params>)" <value_params> --rpc-url $RPC_URL
```

**Convert value returned**

```
 cast --to-base <0xValue> dec
```

**Test**

```
 forge test  
```

**Test verbose**

```
 forge test -vvvvv
```