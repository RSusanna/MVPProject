import UIKit

final class StartRouter {
    
    weak var view: UIViewController?
    
}

// MARK: - Input

extension StartRouter: StartRouterInput {
    func routerToLogin() {
        let loginView = LoginAssembly.assemble()
        view?.navigationController?.pushViewController(loginView, animated: true)
    }
    
    func routeToRegister() {
        print(#function)
    }
    
    func routerToGuest() {
        print(#function)
    }
}
