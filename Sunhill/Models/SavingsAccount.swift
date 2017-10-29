import Foundation

protocol SavingsAccountObserver {
    func intersetRateNotification(lastInterestRate: Double)
    var savingsAccountObserverId: Int {get}
}

class SavingsAccount: Account {
    
    var interestRate: Double {
        didSet {
            // notify observer every time interestRate change
            provideInterestToAllUsers()
        }
    }
    var interestRateObservers: [SavingsAccountObserver]
    
    init(owner: Owner, balance: Double, interestRate: Double) {
        self.interestRate = interestRate
        self.interestRateObservers = []
        super.init(owner: owner, balance: balance)
    }
    
    func startObservingInterestRate(observer: SavingsAccountObserver) {
        interestRateObservers.append(observer)
    }
    
    func stopObservingInterestRate(observer: SavingsAccountObserver) {
        interestRateObservers = interestRateObservers.filter{ $0.savingsAccountObserverId != observer.savingsAccountObserverId}
    }
    
    func provideInterestToAllUsers() {
        interestRateObservers.forEach { (observer) in
            observer.intersetRateNotification(lastInterestRate: interestRate)
        }
    }
    
}
