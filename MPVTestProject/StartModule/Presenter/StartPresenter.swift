import Foundation

final class StartPresenter {
    
    weak var view: StartViewInput?
    private let router: StartRouterInput
    
    init(router: StartRouterInput) {
        self.router = router
    }
    
}

// MARK: - View Input //ПРИШЛО ОТ ВЬЮ

extension StartPresenter: StartPresenterProtocol {
    
    // ВЬЮ ОПОВЕСТИЛО ЧТО ВЬЮ БЫЛО ЗАГРУЖЕНО
    func viewDidLoad() {
        view?.changeBackgroundColor()
    }
}
