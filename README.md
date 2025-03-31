# Decentralized Medical Research Funding Smart Contract

## Overview
This smart contract facilitates decentralized funding for medical research. Donors can contribute tokens, researchers can submit funding proposals, and token holders can vote on proposals. The admin is responsible for allocating funds to the highest-voted proposals.

## Features
- **Fungible Token:** `research-token` is used for donations and voting.
- **Donations:** Users can donate tokens to the research fund.
- **Proposals:** Researchers can submit funding proposals.
- **Voting:** Token holders can vote on proposals.
- **Fund Allocation:** The admin allocates funds to proposals with the most votes.
- **Balance Tracking:** The contract maintains balances for donors and researchers.

## Smart Contract Functions

### Public Functions
- `donate(amount uint)`: Allows users to donate tokens to the research wallet.
- `submit-proposal(amount uint)`: Researchers submit proposals for funding.
- `vote(id uint, vote-weight uint)`: Token holders vote for proposals.
- `allocate-funds(id uint)`: The admin allocates funds to the selected proposal.

### Read-Only Functions
- `get-balance(who principal)`: Retrieves the balance of a given user.
- `get-proposal(proposal-id uint)`: Returns details of a funding proposal.

## Testing
The contract is tested using **Vitest**.
### Test Cases
- Admin can allocate funds to proposals.
- Users can donate and update balances.
- Token holders can vote on proposals.
- Only the admin can allocate funds.

## Installation & Usage
1. Clone the repository:
   ```sh
   git clone https://github.com/idumachika/medicaal_research_funding
   ```
2. Install dependencies:
   ```sh
   npm install
   ```
3. Run tests:
   ```sh
   npm test
   ```

## License
This project is open-source and available under the MIT License.