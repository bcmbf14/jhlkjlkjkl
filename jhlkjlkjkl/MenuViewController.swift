//
//  QuizViewController.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 10/21/20.
//

import UIKit




class MenuViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = Array(1...10)
    
    let menus = [
        [
            ["두음암기"],
            ["보통암기","퀴즈암기"]
        ],
        [
            ["요구사항확인"],
            ["데이터입출력\n구현","통합구현"],
            ["서버프로그램\n구현", "인터페이스\n구현", "화면설계"],
            ["애플리케이션\n테스트관리","SQL응용"],
            ["소프트웨어개발\n보안구축"],
            ["프로그래밍\n언어활용","응용SW기초\n기술활용"],
            ["제품소프트웨어\n패키징"]
        ],
        [
            ["요구사항확인"],
            ["데이터입출력\n구현","통합구현"],
            ["서버프로그램\n구현", "인터페이스\n구현", "화면설계"],
            ["애플리케이션\n테스트관리","SQL응용"],
            ["소프트웨어개발\n보안구축"],
            ["프로그래밍\n언어활용","응용SW기초\n기술활용"],
            ["제품소프트웨어\n패키징"]
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: AtypeMenuCell.identifier, bundle: nil), forCellReuseIdentifier: AtypeMenuCell.identifier)
        tableView.register(UINib(nibName: BtypeMenuCell.identifier, bundle: nil), forCellReuseIdentifier: BtypeMenuCell.identifier)
        tableView.register(UINib(nibName: CtypeMenuCell.identifier, bundle: nil), forCellReuseIdentifier: CtypeMenuCell.identifier)
        
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .aquamarine
        
        
        let headerNib = UINib.init(nibName: "MyHeaderView", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "MyHeaderView")
        
    }
    
    
    
    func alert(){
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
    
    
    
    
    
    
    
}


extension MenuViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menus.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyHeaderView") as! MyHeaderView
        
        
        headerView.contentView.backgroundColor = .white
//        headerView.headerLabel.backgroundColor = .clear
        
        if section == 0 {
            headerView.headerLabel.text = "   두음법칙   "
        }else if section == 1 {
            headerView.headerLabel.text = "   단답형   "
        }else if section == 2 {
            headerView.headerLabel.text = "   약술형   "
        }else{
            return UIView()
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aCell = tableView.dequeueReusableCell(withIdentifier: AtypeMenuCell.identifier) as! AtypeMenuCell
        let bCell = tableView.dequeueReusableCell(withIdentifier: BtypeMenuCell.identifier) as! BtypeMenuCell
        let cCell = tableView.dequeueReusableCell(withIdentifier: CtypeMenuCell.identifier) as! CtypeMenuCell
        
        
        
        
        aCell.selectionStyle = .none
        bCell.selectionStyle = .none
        cCell.selectionStyle = .none
        
        
        
        aCell.tapHandler = { bt in
            self.alert()
            let indexPath = IndexPath(row: indexPath.row, section: indexPath.section)
            self.tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
        }
        
        bCell.tapHandler = { bt in
            self.alert()
            let indexPath = IndexPath(row: indexPath.row, section: indexPath.section)
            self.tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
        }
        
        cCell.tapHandler = { bt in
            self.alert()
            let indexPath = IndexPath(row: indexPath.row, section: indexPath.section)
            self.tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
        }
        
        
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                aCell.backgroundColor = .aquamarine
                aCell.button01.imageView?.tintColor = .darkGray
                aCell.label1.text = "두음암기"
                aCell.button01.setImage(UIImage(systemName: "paperplane" ), for: .highlighted)
                aCell.button01.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
                return aCell
            case 1:
                bCell.backgroundColor = .aquamarine
                bCell.button01.tintColor = .orange
                bCell.button02.tintColor = .steelblue
                bCell.label1.text = "강조암기"
                bCell.label2.text = "퀴즈암기"
                bCell.button01.setImage(UIImage(systemName: "sun.max" ), for: .highlighted)
                bCell.button01.setImage(UIImage(systemName: "sun.max.fill"), for: .normal)
                bCell.button02.setImage(UIImage(systemName: "q.circle" ), for: .highlighted)
                bCell.button02.setImage(UIImage(systemName: "q.circle.fill"), for: .normal)
                return bCell
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                aCell.backgroundColor = .aquamarine
                aCell.button01.imageView?.tintColor = .salmon
                aCell.label1.text = "요구사항확인"
                aCell.button01.setImage(UIImage(systemName: "doc.on.doc" ), for: .highlighted)
                aCell.button01.setImage(UIImage(systemName: "doc.on.doc.fill"), for: .normal)
                return aCell
            case 1:
                bCell.backgroundColor = .aquamarine
                bCell.button01.tintColor = .lawngreen
                bCell.button02.tintColor = .darkgreen
                bCell.label1.text = "데이터입출력\n구현"
                bCell.label2.text = "통합구현"
                bCell.button01.setImage(UIImage(systemName: "arrow.up.arrow.down.circle" ), for: .highlighted)
                bCell.button01.setImage(UIImage(systemName: "arrow.up.arrow.down.circle.fill"), for: .normal)
                bCell.button02.setImage(UIImage(systemName: "cube.box" ), for: .highlighted)
                bCell.button02.setImage(UIImage(systemName: "cube.box.fill"), for: .normal)
                return bCell
            case 2:
                cCell.label1.text = "서버프로그램\n구현"
                cCell.label2.text = "인터페이스\n구현"
                cCell.label3.text = "화면설계"
                cCell.backgroundColor = .aquamarine
                cCell.button01.tintColor = .purpleblue
                cCell.button02.tintColor = .naby
                cCell.button03.tintColor = .darkorchid
                cCell.button01.setImage(UIImage(systemName: "tray.2" ), for: .highlighted)
                cCell.button01.setImage(UIImage(systemName: "tray.2.fill"), for: .normal)
                cCell.button02.setImage(UIImage(systemName: "i.circle" ), for: .highlighted)
                cCell.button02.setImage(UIImage(systemName: "i.circle.fill"), for: .normal)
                cCell.button03.setImage(UIImage(systemName: "rectangle.3.offgrid" ), for: .highlighted)
                cCell.button03.setImage(UIImage(systemName: "rectangle.3.offgrid.fill"), for: .normal)
                return cCell
            case 3:
                bCell.label1.text = "애플리케이션\n테스트관리"
                bCell.label2.text = "SQL응용"
                bCell.backgroundColor = .aquamarine
                bCell.button01.tintColor = .mediumorchid
                bCell.button02.tintColor = .deeppink
                bCell.button01.setImage(UIImage(systemName: "hourglass.tophalf" ), for: .highlighted)
                bCell.button01.setImage(UIImage(systemName: "hourglass.tophalf.fill"), for: .normal)
                bCell.button02.setImage(UIImage(systemName: "chart.bar" ), for: .highlighted)
                bCell.button02.setImage(UIImage(systemName: "chart.bar.fill"), for: .normal)
                return bCell
            case 4:
                aCell.label1.text = "소프트웨어개발\n보안구축"
                aCell.backgroundColor = .aquamarine
                aCell.button01.imageView?.tintColor = .palevioletred
                aCell.button01.setImage(UIImage(systemName: "lock.circle" ), for: .highlighted)
                aCell.button01.setImage(UIImage(systemName: "lock.circle.fill"), for: .normal)
                return aCell
                
            case 5:
                bCell.label1.text = "프로그래밍\n언어활용"
                bCell.label2.text = "응용SW기초\n기술활용"
                bCell.backgroundColor = .aquamarine
                bCell.button01.tintColor = .lightslategray
                bCell.button02.tintColor = .darkslategray
                
                bCell.button01.setImage(UIImage(systemName: "hammer" ), for: .highlighted)
                bCell.button01.setImage(UIImage(systemName: "hammer.fill"), for: .normal)
                bCell.button02.setImage(UIImage(systemName: "chart.pie" ), for: .highlighted)
                bCell.button02.setImage(UIImage(systemName: "chart.pie.fill"), for: .normal)
                
                return bCell
                
                
            case 6:
                aCell.label1.text = "제품소프트웨어\n패키징"
                aCell.backgroundColor = .aquamarine
                aCell.button01.imageView?.tintColor = .silver
                aCell.button01.setImage(UIImage(systemName: "briefcase" ), for: .highlighted)
                aCell.button01.setImage(UIImage(systemName: "briefcase.fill"), for: .normal)
                return aCell
                
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                aCell.backgroundColor = .aquamarine
                aCell.button01.imageView?.tintColor = .salmon
                aCell.label1.text = "요구사항확인"
                aCell.button01.setImage(UIImage(systemName: "doc.on.doc" ), for: .highlighted)
                aCell.button01.setImage(UIImage(systemName: "doc.on.doc.fill"), for: .normal)
                return aCell
            case 1:
                bCell.backgroundColor = .aquamarine
                bCell.button01.tintColor = .lawngreen
                bCell.button02.tintColor = .darkgreen
                bCell.label1.text = "데이터입출력\n구현"
                bCell.label2.text = "통합구현"
                bCell.button01.setImage(UIImage(systemName: "arrow.up.arrow.down.circle" ), for: .highlighted)
                bCell.button01.setImage(UIImage(systemName: "arrow.up.arrow.down.circle.fill"), for: .normal)
                bCell.button02.setImage(UIImage(systemName: "cube.box" ), for: .highlighted)
                bCell.button02.setImage(UIImage(systemName: "cube.box.fill"), for: .normal)
                return bCell
            case 2:
                cCell.label1.text = "서버프로그램\n구현"
                cCell.label2.text = "인터페이스\n구현"
                cCell.label3.text = "화면설계"
                cCell.backgroundColor = .aquamarine
                cCell.button01.tintColor = .purpleblue
                cCell.button02.tintColor = .naby
                cCell.button03.tintColor = .darkorchid
                cCell.button01.setImage(UIImage(systemName: "tray.2" ), for: .highlighted)
                cCell.button01.setImage(UIImage(systemName: "tray.2.fill"), for: .normal)
                cCell.button02.setImage(UIImage(systemName: "i.circle" ), for: .highlighted)
                cCell.button02.setImage(UIImage(systemName: "i.circle.fill"), for: .normal)
                cCell.button03.setImage(UIImage(systemName: "rectangle.3.offgrid" ), for: .highlighted)
                cCell.button03.setImage(UIImage(systemName: "rectangle.3.offgrid.fill"), for: .normal)
                return cCell
            case 3:
                bCell.label1.text = "애플리케이션\n테스트관리"
                bCell.label2.text = "SQL응용"
                bCell.backgroundColor = .aquamarine
                bCell.button01.tintColor = .mediumorchid
                bCell.button02.tintColor = .deeppink
                bCell.button01.setImage(UIImage(systemName: "hourglass.tophalf" ), for: .highlighted)
                bCell.button01.setImage(UIImage(systemName: "hourglass.tophalf.fill"), for: .normal)
                bCell.button02.setImage(UIImage(systemName: "chart.bar" ), for: .highlighted)
                bCell.button02.setImage(UIImage(systemName: "chart.bar.fill"), for: .normal)
                return bCell
            case 4:
                aCell.label1.text = "소프트웨어개발\n보안구축"
                aCell.backgroundColor = .aquamarine
                aCell.button01.imageView?.tintColor = .palevioletred
                aCell.button01.setImage(UIImage(systemName: "lock.circle" ), for: .highlighted)
                aCell.button01.setImage(UIImage(systemName: "lock.circle.fill"), for: .normal)
                return aCell
                
            case 5:
                bCell.label1.text = "프로그래밍\n언어활용"
                bCell.label2.text = "응용SW기초\n기술활용"
                bCell.backgroundColor = .aquamarine
                bCell.button01.tintColor = .lightslategray
                bCell.button02.tintColor = .darkslategray
                
                bCell.button01.setImage(UIImage(systemName: "hammer" ), for: .highlighted)
                bCell.button01.setImage(UIImage(systemName: "hammer.fill"), for: .normal)
                bCell.button02.setImage(UIImage(systemName: "chart.pie" ), for: .highlighted)
                bCell.button02.setImage(UIImage(systemName: "chart.pie.fill"), for: .normal)
                
                return bCell
                
                
            case 6:
                aCell.label1.text = "제품소프트웨어\n패키징"
                aCell.backgroundColor = .aquamarine
                aCell.button01.imageView?.tintColor = .silver
                aCell.button01.setImage(UIImage(systemName: "briefcase" ), for: .highlighted)
                aCell.button01.setImage(UIImage(systemName: "briefcase.fill"), for: .normal)
                return aCell
            default:
                break
            }
        default:
            return UITableViewCell()
        }
        
        
        
        return UITableViewCell()
        
    }
    
    
    
    
}
