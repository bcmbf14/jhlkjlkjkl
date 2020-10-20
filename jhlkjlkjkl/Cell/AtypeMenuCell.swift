//
//  AtypeMenuCell.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 10/21/20.
//

import UIKit

class AtypeMenuCell: UITableViewCell {

    static let identifier = "AtypeMenuCell"

    
    var tapHandler: ((UIButton) -> Void)?

    
    @IBOutlet weak var button01: UIButton!
    
    @IBAction func tapped(_ sender: UIButton) {
        tapHandler?(sender)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        button01.layer.cornerRadius = button01.frame.width/2
        button01.setImage(UIImage(systemName: "tray.fill" ), for: .highlighted)
        button01.setImage(UIImage(systemName: "tray"), for: .normal)
        button01.tintColor = .black
        button01.backgroundColor = .lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
