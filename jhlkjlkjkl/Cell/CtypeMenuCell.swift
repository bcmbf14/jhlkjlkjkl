//
//  CtypeMenuCell.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 10/25/20.
//

import UIKit

class CtypeMenuCell: UITableViewCell {

    
    static let identifier = "CtypeMenuCell"

    var qtype = QType.Short

    
    var tapHandler: ((String, QType) -> Void)?

    
    
    @IBAction func tapped(_ sender: UIButton) {        
        switch sender {
        case button01 :
            guard let title = label1.text else { return }
            tapHandler?(title, qtype)
        case button02 :
            guard let title = label2.text else { return }
            tapHandler?(title, qtype)
        case button03 :
            guard let title = label3.text else { return }
            tapHandler?(title, qtype)
        default:
            break
        }
    }
    
    @IBOutlet weak var button01: UIButton!
    @IBOutlet weak var button02: UIButton!
    @IBOutlet weak var button03: UIButton!

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        button01.setImage(UIImage(systemName: "house.fill" ), for: .highlighted)
        button01.setImage(UIImage(systemName: "house"), for: .normal)
        
        button02.setImage(UIImage(systemName: "briefcase.fill" ), for: .highlighted)
        button02.setImage(UIImage(systemName: "briefcase"), for: .normal)
        
        
        
        
        button03.setImage(UIImage(systemName: "trash.fill" ), for: .highlighted)
        button03.setImage(UIImage(systemName: "trash"), for: .normal)
        
        
        
        [label1,label2,label3].forEach { label in
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



