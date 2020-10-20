//
//  QuizViewController.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 10/21/20.
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
}



class MenuViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = Array(1...10)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: AtypeMenuCell.identifier, bundle: nil), forCellReuseIdentifier: AtypeMenuCell.identifier)
        tableView.register(UINib(nibName: BtypeMenuCell.identifier, bundle: nil), forCellReuseIdentifier: BtypeMenuCell.identifier)
        tableView.bounces = false
        tableView.separatorStyle = .none
    }
    
    

    
    
    

}


extension MenuViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aCell = tableView.dequeueReusableCell(withIdentifier: AtypeMenuCell.identifier) as! AtypeMenuCell
        let bCell = tableView.dequeueReusableCell(withIdentifier: BtypeMenuCell.identifier) as! BtypeMenuCell
        
        aCell.selectionStyle = .none
        bCell.selectionStyle = .none
        
        
        aCell.tapHandler = { bt in
            print(bt.titleLabel?.text)
            let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
            
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            let messageText = NSAttributedString(
                string: "전체학습 1/132\nㅇㅇㅇ학습으로 이동하시겠습니까?",
                attributes: [
                    NSAttributedString.Key.paragraphStyle: paragraphStyle,
                    NSAttributedString.Key.foregroundColor : UIColor.yellow,
//                    NSAttributedString.Key.font : UIFont(name: "name", size: size)
                ]
            )

            alert.setValue(messageText, forKey: "attributedMessage")
            
            
            let okAction = UIAlertAction(title: "학습하기", style: .destructive) { (_) in
                
            }
            let calcelAction = UIAlertAction(title: "취소", style: .default) { (_) in
                
            }
            alert.addAction(okAction)
            alert.addAction(calcelAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        bCell.tapHandler = { bt in
            print(bt.titleLabel?.text)
        }
        
        switch indexPath.row {
        case 0:
            return aCell
        case 1:
            return bCell
        case 2:
            return aCell
        case 3:
            return bCell
        case 4:
            return aCell
        default:
            return UITableViewCell()
        }
    }
    
    
    
    
}
