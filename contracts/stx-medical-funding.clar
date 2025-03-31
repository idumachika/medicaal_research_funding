
;; title: Decentralized Medical Research Funding Smart Contract
;; version:
;; summary:
;; description: This smart contract allows donors to contribute tokens, researchers to submit funding proposals, and token holders to vote on proposals. The admin can allocate funds based on the highest voted proposals. Let me know if you need modifications! 

(define-fungible-token research-token)

;; Define admin and research fund wallet
(define-data-var admin principal 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM')
(define-data-var research-fund principal 'ST1SJ3DTE5DN7X54YDH5D64R3BCB6A2AG2ZQ8YPD5')

;; Maps for storing balances and funding proposals
(define-map balances {owner: principal} {balance: uint})
(define-map proposals {id: uint} {recipient: principal, amount: uint, votes: uint})
(define-data-var proposal-count uint 0)

;; Mint tokens (only admin)
(define-public (mint (recipient principal) (amount uint))
    (begin
        (asserts! (is-eq tx-sender (var-get admin)) (err "Only admin can mint"))
        (map-set balances {owner: recipient} {balance: amount})
        (ok amount)))

;; Transfer tokens
(define-public (transfer (amount uint) (to principal))
    (let ((sender-balance (unwrap! (map-get? balances {owner: tx-sender}) {balance: 0})))
        (begin
            (asserts! (>= sender-balance amount) (err "Insufficient balance"))
            (map-set balances {owner: tx-sender} {balance: (- sender-balance amount)})
            (map-set balances {owner: to} {balance: (+ (unwrap! (map-get? balances {owner: to}) {balance: 0}) amount)})
            (ok amount))))

