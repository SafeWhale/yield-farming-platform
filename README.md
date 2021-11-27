# yield-farming-platform
Safe Whale is a new yield farming platform allowing users to create new BEP20 and BEP721 based farms.


Audit : https://solidity.finance/audits/SafeWhale/

Audit Summary


Notes on the BEP20Farm and BEP721Farm Contracts:

These contracts allow users to stake a single asset determined by the project team in exchange for rewards in a second asset determined by the team.
In order to stake, users must have a minimum amount of a tertiary "utility" asset. Both the asset and the minimum amount needed are determined by the team.
The team must exercise caution when deciding the staking token to avoid BEP777-compliant tokens (this is uncommon).
Users will receive a reward amount based on the amount staked and the reward rate set by the owner on deployment; staking rewards can be calculated and transferred to the user once a day.
A cooldown period must pass before users are able to unstake their assets.
Fees are taken on deposit and withdrawal in the BEP20 Farm contract; they are taken from rewards payouts in the BEP721 Farm contract. There is no limit on fees taken and they can be set up to 100%.
On withdrawals, the user will receive the entire amount of the staking tokens they deposited minus fees where applicable; pending rewards are calculated and transferred.
Users also have the option to collect their rewards without unstaking.
Fees are initially collected in the contract for the owner to withdraw. The owner may elect to stop receiving fees and instead permanently distribute them as rewards amongst stakers.
Reward tokens must be supplied to the contract to be distributed. Users will lose their rewards if they withdraw while there are no reward tokens in the contract.
The owner is able to put the contract into an emergency state at anytime. This will disable all regular functionality of the contract.
While in an emergency state, the owner is able to withdraw all of the rewards tokens in the contract. Users can also trigger an emergency withdraw, which will transfer all the user's deposited tokens to their wallet address, without calculating rewards.


General Notes on all Contracts:

The contracts comply with the relevant BEP721 and BEP20 token standards.
As the project is implemented with Solidity version ^0.8.4, it is protected from overflows.
The team worked with us to implement changes related to gas optimization.

Audit Findings Summary

No external threats were identified.
Ensure trust in the team as they have considerable control within the ecosystem.
Date: November 4th, 2021.
