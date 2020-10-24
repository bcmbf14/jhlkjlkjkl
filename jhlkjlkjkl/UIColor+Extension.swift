//
//  UIColor+Extension.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 10/25/20.
//

import UIKit


extension UIColor {
    
    class var aquamarine: UIColor { return UIColor.init(hexString: "#7FFFD4")}
    
    class var steelblue: UIColor { return UIColor.init(hexString: "#4682B4")}
    
    class var salmon: UIColor { return UIColor.init(hexString: "#FA8072")}

    class var lawngreen: UIColor { return UIColor.init(hexString: "#7CFC00")}

    class var darkgreen: UIColor { return UIColor.init(hexString: "#006400")}
    
    class var darkcyan: UIColor { return UIColor.init(hexString: "#008B8B")}

    class var purpleblue: UIColor { return UIColor.init(hexString: "#6A5ACD")}

    class var naby: UIColor { return UIColor.init(hexString: "#000080")}

    class var darkorchid: UIColor { return UIColor.init(hexString: "#9932CC")}

    class var mediumorchid: UIColor { return UIColor.init(hexString: "#BB55D3")}

    class var deeppink: UIColor { return UIColor.init(hexString: "#FF1493")}

    class var palevioletred: UIColor { return UIColor.init(hexString: "#DB7093")}

    class var blanchedalmond: UIColor { return UIColor.init(hexString: "#FFEBCD")}
    
    class var lemonchiffon: UIColor { return UIColor.init(hexString: "#FFFACD")}

    class var silver: UIColor { return UIColor.init(hexString: "#C0C0C0")}

    class var lightslategray: UIColor { return UIColor.init(hexString: "#778899")}
    
    class var darkslategray: UIColor { return UIColor.init(hexString: "#2F4F4F")}

}



extension UIColor {
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
}



