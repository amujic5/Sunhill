import XCTest

class CheckingAccountTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInit() {
        let owner = Owner(name: "")
        let checkingAccount = try! CheckingAccount(owner: owner, balance: 10, withdrawingLimit: 0)
        
        XCTAssertEqual(checkingAccount.currentWithdrawingLimit(), 0, "Limit should be 0")
    }
    
    func testInitWithNegativeWithdrawingLimit() {
        let owner = Owner(name: "")
        XCTAssertThrowsError(try CheckingAccount(owner: owner, balance: 10, withdrawingLimit: -10))
    }
    
    func testSettingWithdrawingLimit() {
        let owner = Owner(name: "")
        let checkingAccount = try! CheckingAccount(owner: owner, balance: 10, withdrawingLimit: 0)
        
        try! checkingAccount.setWithdrawingLimit(20)
        
        XCTAssertEqual(checkingAccount.currentWithdrawingLimit(), 20, "After setting new limit, amount should be 20")
    }
    
    func testSettingNegativeWithdrawingLimit() {
        let owner = Owner(name: "")
        let checkingAccount = try! CheckingAccount(owner: owner, balance: 10, withdrawingLimit: 0)
        
        XCTAssertThrowsError(try checkingAccount.setWithdrawingLimit(-10))
    }

    func testTransferMoney() {
        
        let owner1 = Owner(name: "owner1")
        let account1 = try! CheckingAccount(owner: owner1, balance: 100, withdrawingLimit: 0)
        
        let owner2 = Owner(name: "owner2")
        let account2 = Account(owner: owner2, balance: 10)
        
        try! account1.transfer(amount: 100, to: account2)
        
        XCTAssertEqual(account1.currentAccountBalance(), 0, "Account 1 current balance should be 0 after transaction")
        XCTAssertEqual(account2.currentAccountBalance(), 110, "Account 2 current balance should be 110 after transaction")
        
    }
    
    func testWithdrawingMoneyMoreThanBalance() {
        let owner = Owner(name: "")
        let account = try! CheckingAccount(owner: owner, balance: 10, withdrawingLimit: 10)
        
        try! account.withdrawMoney(amount: 20)
        XCTAssertEqual(account.currentAccountBalance(), -10, "After withdrawing money, account balance should be 0")
    }
    
    func testWithdrawingMoneyMorenThanBalanceAndLimit() {
        let owner = Owner(name: "")
                let account = try! CheckingAccount(owner: owner, balance: 10, withdrawingLimit: 10)
        
        XCTAssertThrowsError(try account.withdrawMoney(amount: 30))
    }
    
}
