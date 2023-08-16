import Foundation

final class LoginPresenter {
    
    weak var view: LoginViewInput?
    private let router: LoginRouterInput
    
    init(router: LoginRouterInput) {
        self.router = router
    }
    
}

extension LoginPresenter: LoginPresenterProtocol {
    
}
