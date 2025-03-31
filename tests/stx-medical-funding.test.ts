// Vitest Test Suite
import { describe, test, expect } from 'vitest';

describe("Decentralized Medical Research Funding", () => {
    test("Admin can allocate funds", () => {
        const admin = "ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM";
        const researcher = "ST1SJ3DTE5DN7X54YDH5D64R3BCB6A2AG2ZQ8YPD5";

        let balances = {
            [admin]: 1000,
            [researcher]: 0,
        };
        let proposals = {
            0: { researcher, amount: 500, votes: 100 },
        };

        const donate = (amount) => {
            if (balances[admin] >= amount) {
                balances[admin] -= amount;
                balances[researcher] += amount;
                return amount;
            }
            throw new Error("Insufficient balance");
        };

        // Simulating fund allocation by admin
        const allocateFunds = (id) => {
            const proposal = proposals[id];
            if (!proposal) throw new Error("Proposal not found");
            if (balances[researcher] < proposal.amount) throw new Error("Insufficient funds");

            balances[researcher] -= proposal.amount;
            balances[proposal.researcher] += proposal.amount;
            return proposal.amount;
        };

        // Execute functions
        donate(1000);
        const allocated = allocateFunds(0);

        // Assertions
        expect(allocated).toBe(500);
        expect(balances[researcher]).toBe(500);
    });
});
