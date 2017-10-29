import Foundation

class Account {
    
    var owner: Owner
    private var balance: Double
    
    init(owner: Owner, balance: Double) {
        self.owner = owner
        self.balance = balance
    }
    
    func addMoney(amount: Double) throws {
        if amount < 0 {
            throw AccountError.addingNegativeMoney
        }
        balance += amount
    }
    
    func withdrawMoney(amount: Double) throws {
        try checkIsEligibleToWithdrawMoney(amount: amount)
        balance -= amount
    }
    
    func checkIsEligibleToWithdrawMoney(amount: Double) throws {
        if amount > balance {
            throw AccountError.withdrawingExtendsLimit
        }
    }
        
    func currentAccountBalance() -> Double {
        return balance
    }
    
}
