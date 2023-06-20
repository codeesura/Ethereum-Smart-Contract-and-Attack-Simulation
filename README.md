# Ethereum Smart Contract Attack Simulation

This repo contains two Ethereum smart contracts, KurbanContract and Attack, exemplifying a reentrancy attack. The KurbanContract manages user balances, while Attack exploits a vulnerability, serving as a vital educational resource in smart contract security.

## KurbanContract

`KurbanContract` is a simple Ethereum smart contract that allows users to deposit Ether, check their balance, and withdraw their funds. It uses a mapping `balances` to keep track of the amount of Ether each user has deposited into the contract.

Functions in `KurbanContract`:

- `deposit()`: A payable function that allows users to deposit Ether into the contract. The deposited amount is added to the user's balance.

- `getBalance()`: A function to view the total balance of the contract.

- `withdraw()`: A function that allows users to withdraw their deposited Ether from the contract. If successful, the balance of the user is set to 0.

## Attack

`Attack` is a malicious Ethereum smart contract that exploits the reentrancy vulnerability in `KurbanContract`. It uses the fallback function to recursively call the `withdraw` function of `KurbanContract`, draining the contract of all its Ether.

Functions in `Attack`:

- `getBalance()`: A function to view the total balance of the contract.

- `attack()`: A payable function that deposits Ether into `KurbanContract` and then immediately calls `withdraw` to start the attack.

- `fallback()`: A payable function that automatically gets executed if no other function matches the given function signature. In this case, it recursively calls `KurbanContract`'s `withdraw` function if the balance of `KurbanContract` is greater than or equal to the amount of Ether sent with the function call.

- `receive()`: An external payable function that allows the contract to receive Ether.

To initiate the attack, the `attack()` function needs to be called with a certain amount of Ether. Once started, the attack will continue until `KurbanContract` has been drained of all its Ether.

**Note:** This code is for educational purposes only and should not be used in production as it contains a well-known reentrancy vulnerability. Always follow best practices when writing Ethereum smart contracts. 

### Disclaimer

This repository and its code are intended for educational purposes only. Misuse of this code can result in loss of funds or potential legal repercussions. Always be aware of the security concerns and never use untested code in a production environment.
