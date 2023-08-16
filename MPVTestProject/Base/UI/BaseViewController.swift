import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    func createMainButton(title: String,
                          titleColor: UIColor,
                          font: UIFont,
                          backgroundColor: UIColor,
                          radius: CGFloat = 8) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = font
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = radius
        return button
    }
    func createLineView() -> UIView {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }

    func createImageButton(imageName: String, borderColor: UIColor, radius: CGFloat = 8) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = borderColor.cgColor
        button.layer.cornerRadius = radius
        return button
    }
    
    func createImageView(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        return imageView
    }
    
    func createMainUILabel(text: String) -> UILabel {
        let textView = UILabel()
        textView.text = text
        textView.textColor = .darkBlue
        textView.lineBreakMode = .byWordWrapping
        textView.numberOfLines = 0
        textView.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        return textView
    }

    func toStackView(subviews: [UIView],
                     axis: NSLayoutConstraint.Axis, spacing: CGFloat,
                     alignment: UIStackView.Alignment,
                     distribution: UIStackView.Distribution) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.axis = axis
        stack.spacing = spacing
        stack.alignment = alignment
        stack.distribution = distribution
        return stack
    }
}
