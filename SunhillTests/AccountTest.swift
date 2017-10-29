import XCTest

class AccountTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAddingMoney() {
  
        let owner = Owner(name: "")
        let account = Account(owner: owner, balance: 10)
        
        try! account.addMoney(amount: 10)
        XCTAssertEqual(account.currentAccountBalance(), 20, "After adding 10 account balance should be 20")
        
    }
    
    func testAddingNegativeMoney() {
        
        let owner = Owner(name: "")
        let account = Account(owner: owner, balance: 10)
        
        try! account.addMoney(amount: 10)
        
        
        XCTAssertThrowsError(try account.addMoney(amount: -10))
    }
    
    func testWithdrawingMoney() {
        let owner = Owner(name: "")
        let account = Account(owner: owner, balance: 10)
        
        try! account.withdrawMoney(amount: 10)
        XCTAssertEqual(account.currentAccountBalance(), 0, "After withdrawing money, account balance should be 0")
    }
    
    func testWithdrawingMoneyMoreThanBalance() {
        let owner = Owner(name: "")
        let account = Account(owner: owner, balance: 10)
        
        XCTAssertThrowsError(try account.withdrawMoney(amount: 20))
    }
    
}
