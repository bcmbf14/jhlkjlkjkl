//
//  MenuViewCell.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 10/21/20.
//

import UIKit

class BtypeMenuCell: UITableViewCell {
    
    static let identifier = "BtypeMenuCell"

    
    
    var tapHandler: ((UIButton) -> Void)?

    
    
    @IBAction func tapped(_ sender: UIButton) {
        tapHandler?(sender)
    }
    
    @IBOutlet weak var button01: UIButton!
    @IBOutlet weak var button02: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        button01.layer.cornerRadius = button01.frame.width/2
        button02.layer.cornerRadius = button02.frame.width/2
        
        button01.setImage(UIImage(systemName: "house.fill" ), for: .highlighted)
        button01.setImage(UIImage(systemName: "house"), for: .normal)
        button01.tintColor = .black
        button02.setImage(UIImage(systemName: "briefcase.fill" ), for: .highlighted)
        button02.setImage(UIImage(systemName: "briefcase"), for: .normal)
        button02.tintColor = .black
        
        button01.backgroundColor = .lightGray
        button02.backgroundColor = .lightGray
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}



extension UIButton {
    func alignVertical(spacing: CGFloat = 10.0) {
        guard let text = titleLabel?.text,
            let font = titleLabel?.font
            else { return }
        let imageSize = CGSize(width: 50.0, height: 50.0)
            
        titleEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: -imageSize.width,
            bottom: -(imageSize.height + spacing),
            right: 0.0
        )
        
        let titleSize = text.size(withAttributes: [.font: font])
        imageEdgeInsets = UIEdgeInsets(
            top: -(titleSize.height + spacing),
            left: 0.0,
            bottom: 0.0, right: -titleSize.width
        )
        
        let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0
        contentEdgeInsets = UIEdgeInsets(
            top: edgeOffset,
            left: 0.0,
            bottom: edgeOffset,
            right: 0.0
        )
    }
}
