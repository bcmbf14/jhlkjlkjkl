//
//  ColorSetCell.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 10/9/20.
//

import UIKit

class ColorSetCell: UITableViewCell {

    static let identifier = "ColorSetCell"
    var handler: (() -> ())?

    @IBOutlet weak var baseColorButton: UIButton!
    @IBOutlet weak var highlightButton: UIButton!
    
    @IBAction func tapped(_ sender: UIButton) {
        handler?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.layer.borderWidth = 0.5
        baseColorButton.layer.cornerRadius = 10
        highlightButton.layer.cornerRadius = 10
    }

}
