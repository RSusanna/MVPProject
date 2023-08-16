import UIKit

final class StartAssembly {
    static func assemble() -> UIViewController {
        
        let router = StartRouter()
        let presenter = StartPresenter(router: router)
        let view = StartViewController(presenter: presenter)
        
        router.view = view
        presenter.view = view
        
        return view
    }
}
