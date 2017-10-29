import Foundation

class Owner {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
}

// MARK: SavingsAccountObserver

extension Owner: SavingsAccountObserver {
    
    var savingsAccountObserverId: Int {
        // sholud be something else, but lets say that names are unique
        return name.hashValue
    }
    
    func intersetRateNotification(lastInterestRate: Double) {
        print("user: \(name) notifyed about last interestRate: \(lastInterestRate)")
    }
    
}
