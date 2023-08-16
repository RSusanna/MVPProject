import UIKit

final class LoginViewController: BaseViewController {
    
    private let presenter: LoginPresenterProtocol
    
    init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemRed
    }
}

extension LoginViewController: LoginViewInput {
    
}
