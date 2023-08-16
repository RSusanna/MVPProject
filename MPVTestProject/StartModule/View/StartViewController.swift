import UIKit

final class StartViewController: UIViewController {
    
    private let presenter: StartPresenterProtocol
    
    init(presenter: StartPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        presenter.viewDidLoad() // СООБЩАЕМ ПРЕЗЕНТЕРУ ЧТО ВЬЮ ЗАГРУЗИЛОСЬ
    }


}

// MARK: - Input

extension StartViewController: StartViewInput {
    
    // ПРЕЗЕНТЕР ДАЛ КОМАНДУ ПОМЕНЯТЬ ЦВЕТ
    
    func changeBackgroundColor() {
        self.view.backgroundColor = .systemGreen
    }
}
