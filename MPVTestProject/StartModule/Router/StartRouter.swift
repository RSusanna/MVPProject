import UIKit

final class StartRouter {
    
    weak var view: UIViewController?
    
}

// MARK: - Input

extension StartRouter: StartRouterInput {
    func routerToLogin() {
        print(#function)
    }
    
    func routeToRegister() {
        print(#function)
    }
    
    func routerToGuest() {
        print(#function)
    }
}
