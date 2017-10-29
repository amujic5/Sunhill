import Foundation

enum AccountError: Error {
    case withdrawingLimitNegative
    case withdrawingExtendsLimit
    case addingNegativeMoney
}
