//
//  IconButton.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 10/25/20.
//

import UIKit



@IBDesignable
class IconButton: UIButton {
    
    @IBInspectable var pointSize:CGFloat = 50.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if #available(iOS 13.0, *) {
            let config = UIImage.SymbolConfiguration(pointSize: pointSize)
            setPreferredSymbolConfiguration(config, forImageIn: .normal)
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    override var isHighlighted: Bool{
        didSet {
            if oldValue == false && isHighlighted {
                self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            } else if oldValue == true && !isHighlighted {
                self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUI()
        
    }
    
    
    func setUpUI(){
        self.layer.cornerRadius = self.frame.width/2
        self.backgroundColor = .white
        self.layer.shadowColor = UIColor.lightslategray.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 10
        self.layer.masksToBounds = false
        
        
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    
    
    
    
    
    
    
}
