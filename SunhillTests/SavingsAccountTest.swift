import XCTest

class MockObserver: SavingsAccountObserver {
    
    var savingsAccountObserverId: Int
    var intersetRateNotificationCounter: Int = 0
    
    init(savingsAccountObserverId: Int) {
        self.savingsAccountObserverId = savingsAccountObserverId
    }
    
    func intersetRateNotification(lastInterestRate: Double) {
        intersetRateNotificationCounter += 1
    }
    
}

class SavingsAccountTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInit() {
        let owner = Owner(name: "")
        let account = SavingsAccount(owner: owner, balance: 20, interestRate: 0.5)
        
        XCTAssertEqual(account.interestRate, 0.5, "Interest rate should be 0.5!")
        XCTAssertEqual(account.currentAccountBalance(), 20, "Current account balance should be 20!")
    }
    
    func testObserver() {
        let owner = Owner(name: "")
        let account = SavingsAccount(owner: owner, balance: 20, interestRate: 0.5)
        
        let observer1 = MockObserver(savingsAccountObserverId: 0)
        account.startObservingInterestRate(observer: observer1)
        account.interestRate = 1
        
        XCTAssertEqual(observer1.intersetRateNotificationCounter, 1, "Observer 1 should be notifyed once.")
    }
    
    func testMultipleObservers() {
        let owner = Owner(name: "")
        let account = SavingsAccount(owner: owner, balance: 20, interestRate: 0.5)
        
        let observer1 = MockObserver(savingsAccountObserverId: 0)
        account.startObservingInterestRate(observer: observer1)
        account.interestRate = 1
        
        let observer2 = MockObserver(savingsAccountObserverId: 2)
        account.startObservingInterestRate(observer: observer2)
        account.interestRate = 2
        
        XCTAssertEqual(observer1.intersetRateNotificationCounter, 2, "Observer 1 should be notifyed twice.")
        XCTAssertEqual(observer2.intersetRateNotificationCounter, 1, "Observer 2 should be notifyed once.")
    }
    
    func testObserverWithStopObserving() {
        let owner = Owner(name: "")
        let account = SavingsAccount(owner: owner, balance: 20, interestRate: 0.5)
        
        let observer1 = MockObserver(savingsAccountObserverId: 0)
        account.startObservingInterestRate(observer: observer1)
        account.interestRate = 1
        account.stopObservingInterestRate(observer: observer1)
        account.interestRate = 3
        
        XCTAssertEqual(observer1.intersetRateNotificationCounter, 1, "Observer 1 should be notifyed once.")
    }
    
}
