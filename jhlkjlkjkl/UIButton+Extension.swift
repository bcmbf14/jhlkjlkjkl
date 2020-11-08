//
//  UIButton+Extension.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 10/25/20.
//

import UIKit


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
