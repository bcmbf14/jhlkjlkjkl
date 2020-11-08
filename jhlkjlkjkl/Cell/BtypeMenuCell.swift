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
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        button01.setImage(UIImage(systemName: "house.fill" ), for: .highlighted)
        button01.setImage(UIImage(systemName: "house"), for: .normal)
        
        button02.setImage(UIImage(systemName: "briefcase.fill" ), for: .highlighted)
        button02.setImage(UIImage(systemName: "briefcase"), for: .normal)
        
        button02.tintColor = .gray
        
        
        [label1,label2].forEach { label in
            guard let label = label else{return}
            label.layer.shadowColor = UIColor.black.cgColor
            label.layer.shadowRadius = 3.0
            label.layer.shadowOpacity = 1.0
            label.layer.shadowOffset = CGSize(width: 2, height: 2)
            label.layer.masksToBounds = false
        }
        
       
        
        
        
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}



