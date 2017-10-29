import Foundation

class CheckingAccount: Account {
    
    private var withdrawingLimit: Double
    
    init(owner: Owner, balance: Double, withdrawingLimit: Double = 0) throws {
        if withdrawingLimit < 0 {
            throw AccountError.withdrawingLimitNegative
        }
        self.withdrawingLimit = withdrawingLimit
        super.init(owner: owner, balance: balance)
    }
    
    override func checkIsEligibleToWithdrawMoney(amount: Double) throws {
        if amount > currentAccountBalance() + withdrawingLimit {
            throw AccountError.withdrawingExtendsLimit
        }
    }
    
    func currentWithdrawingLimit() -> Double {
        return withdrawingLimit
    }
    
    func setWithdrawingLimit(_ withdrawingLimit: Double) throws {
        if withdrawingLimit < 0 {
            throw AccountError.withdrawingLimitNegative
        }
        self.withdrawingLimit = withdrawingLimit
    }
    
    func transfer(amount: Double, to account: Account) throws {
        try withdrawMoney(amount: amount)
        try account.addMoney(amount: amount)
    }
    
}


