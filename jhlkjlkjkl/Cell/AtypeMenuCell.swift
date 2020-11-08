//
//  AtypeMenuCell.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 10/21/20.
//

import UIKit

class AtypeMenuCell: UITableViewCell {

    static let identifier = "AtypeMenuCell"

    
    var tapHandler: ((String, QType) -> Void)?

    var qtype = QType.Short
    
    @IBOutlet weak var button01: IconButton!

    @IBOutlet weak var label1: UILabel!
    
    @IBAction func tapped(_ sender: UIButton) {
        guard let title = label1.text else { return }
        tapHandler?(title, qtype)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        button01.setImage(UIImage(systemName: "tray.fill" ), for: .highlighted)
        button01.setImage(UIImage(systemName: "tray"), for: .normal)


        
        label1.layer.shadowColor = UIColor.black.cgColor
        label1.layer.shadowRadius = 3.0
        label1.layer.shadowOpacity = 1.0
        label1.layer.shadowOffset = CGSize(width: 2, height: 2)
        label1.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
