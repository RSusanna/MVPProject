import UIKit

extension UIColor {
    convenience init(components red: CGFloat,
                     green: CGFloat,
                     blue: CGFloat,
                     alpha: CGFloat) {
        let const: CGFloat = 255.0
        self.init(red: red / const,
                  green: green / const,
                  blue: blue / const,
                  alpha: alpha)
    }
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    class var darkBlue: UIColor {
        return UIColor(rgb: 0x1E232C)
    }
    class var lightGray: UIColor{
        return UIColor(rgb: 0xE8ECF4)
    }
    class var verylightGrayColor: UIColor {
        return UIColor(rgb: 0xF7F8F9)
    }
    
    class var lightBlueColor: UIColor {
        return UIColor(rgb: 0x35C2C1)
    }
}
