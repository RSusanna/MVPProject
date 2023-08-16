import UIKit

final class LoginAssembly {
    static func assemble() -> UIViewController {
        let router = LoginRouter()
        let presenter = LoginPresenter(router: router)
        let view = LoginViewController(presenter: presenter)

        router.view = view
        presenter.view = view
        return view
    }
}
