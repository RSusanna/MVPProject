import UIKit
import SnapKit

extension StartViewController {
    struct Appearance {
        let darkColor: UIColor = .darkBlue
        let lightBlueColor: UIColor = .lightBlueColor
        
        let backgroundImage: UIImage? = UIImage(named: "backgroundImage")
        let logoImage: UIImage? = UIImage(named: "Branding")
        
        let buttonSidePadding: CGFloat = 22.0
        let registerButtonBottomPadding: CGFloat = -22.0
        let stackBottomPadding: CGFloat = -46.0
        let buttonHeight: CGFloat = 56.0
        let loginButtonBottomPadding: CGFloat = -15.0
        let logoImageBottomPadding: CGFloat = -44.0
        let logoImageSidePadding: CGFloat = 117.0
        let logoImageMultipyedHeight: CGFloat = 0.7
        let borderWidht: CGFloat = 1
        let stackSidePadding: CGFloat = 22.0
        let stackHeight: CGFloat = 56.0
    }
}

final class StartViewController: BaseViewController {
    
    // MARK: - Constants
    
    private let presenter: StartPresenterProtocol
    private let appearance: Appearance
    
    private lazy var backgroundImageView: UIImageView = {
        return UIImageView(image: appearance.backgroundImage)
    }()
    
    private lazy var logoImageView: UIImageView = {
        let logoImage = createImageView(imageName: "branding")
        return logoImage
    }()
    
    private lazy var loginButton: UIButton = {
        let button = createMainButton(
            title: "Login", titleColor: .white, font: .semibold15,
            backgroundColor: .darkBlue
        )
        //открытие новой вьюшки
        button.addTarget(self, action: #selector(actionButtonLogIn), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = createMainButton(
            title: "Register", titleColor: .black, font: .semibold15,
            backgroundColor: .white
        )
        button.addTarget(self, action: #selector(registerButtonLogIn), for: .touchUpInside)
        button.layer.borderWidth = appearance.borderWidht
        button.layer.borderColor = appearance.darkColor.cgColor
        return button
    }()
    
    private lazy var guestButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue as a guest", for: .normal)
        button.titleLabel?.font =  .semibold15
        button.setTitleColor(appearance.lightBlueColor, for: .normal)
        return button
    }()
    
    private lazy var googleButton: UIButton = {
        let button = createImageButton(imageName: "google", borderColor: .lightGray)
        return button
    }()
    
    private lazy var appleButton: UIButton = {
        let button = createImageButton(imageName: "apple", borderColor: .lightGray)
        return button
    }()
    
    private lazy var faceButton: UIButton = {
        let button = createImageButton(imageName: "facebook", borderColor: .lightGray)
        return button
    }()
    
    private lazy var socialMesiaStackView: UIStackView = {
        let stack = toStackView(subviews: [googleButton,
                                           faceButton,
                                           appleButton],
                                axis: .horizontal, spacing: 8, alignment: .fill, distribution: .fillEqually)
        return stack
    }()
    
    // MARK: - Init
    
    init(presenter: StartPresenterProtocol) {
        self.presenter = presenter
        self.appearance = Appearance()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemRed
        addSubviews()
        setupViewsConstraints()
        presenter.viewDidLoad() // СООБЩАЕМ ПРЕЗЕНТЕРУ ЧТО ВЬЮ ЗАГРУЗИЛОСЬ
    }


}

// MARK: - Input

extension StartViewController: StartViewInput {
    
    // ПРЕЗЕНТЕР ДАЛ КОМАНДУ ПОМЕНЯТЬ ЦВЕТ
    
    func changeBackgroundColor() {
        //self.view.backgroundColor = .systemGreen
    }
}

private extension StartViewController {
    @objc func actionButtonLogIn() {
        presenter.didTapLogin()
    }
    
    @objc func registerButtonLogIn() {
        presenter.didTapRegister()
    }
    
    //добавление вьюшек
    func addSubviews() {
        [backgroundImageView, loginButton,
         registerButton, guestButton, logoImageView, socialMesiaStackView
        ].forEach({ self.view.addSubview($0) })
    }
    
    func setupViewsConstraints() {
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        guestButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        socialMesiaStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(appearance.stackSidePadding)
            make.height.equalTo(appearance.stackHeight)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(appearance.stackBottomPadding)
        }
        
        registerButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(appearance.buttonSidePadding)
            make.height.equalTo(appearance.buttonHeight)
            make.bottom.equalTo(socialMesiaStackView.snp.top).inset(appearance.registerButtonBottomPadding)
        }
        
        loginButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(appearance.buttonSidePadding)
            make.height.equalTo(appearance.buttonHeight)
            make.bottom.equalTo(registerButton.snp.top).inset(appearance.loginButtonBottomPadding)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(appearance.logoImageSidePadding)
            make.height.equalTo(logoImageView.snp.width).multipliedBy(appearance.logoImageMultipyedHeight)
            make.bottom.equalTo(loginButton.snp.top).inset(appearance.logoImageBottomPadding)
        }
        //        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([
        //            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
        //            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        //            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        //            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        //        ])
        //
        //        guestButton.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([
        //            guestButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        //            guestButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        //        ])
        //
        //        registerButton.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([
        //            registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constants.buttonSidePadding),
        //            registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -constants.buttonSidePadding),
        //            registerButton.heightAnchor.constraint(equalToConstant: constants.buttonHeight),
        //            registerButton.bottomAnchor.constraint(equalTo: guestButton.topAnchor, constant: constants.registerButtonBottomPadding)
        //        ])
        //
        //        loginButton.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([
        //            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constants.buttonSidePadding),
        //            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -constants.buttonSidePadding),
        //            loginButton.heightAnchor.constraint(equalToConstant: constants.buttonHeight),
        //            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: constants.loginButtonBottomPadding)
        //        ])
        //
        //        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([
        //            logoImageView.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -constants.logoImageBottomPadding),
        //            logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constants.logoImageSidePadding),
        //            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -constants.logoImageSidePadding),
        //            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: constants.logoImageMultipyedHeight)
        //        ])
        //    }
    }
}
