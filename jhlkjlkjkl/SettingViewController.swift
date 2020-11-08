//
//  SettingViewController.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 10/9/20.
//

import UIKit

class SettingViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.bounces = false
        
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeContentTitle = "Setting"
    }
    
    
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
   
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.textColor = .darkGray
        cell.selectionStyle = .none
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "색상대비값 변경"
            cell.detailTextLabel?.text = "각 암기화면에 나와있는 기본색상과 강조색상을 변경합니다."
        case 1:
            cell.textLabel?.text = "저작권 정보"
            cell.detailTextLabel?.text = "애플리케이션에 사용된 데이터의 저작권 설명입니다."
        case 2:
            cell.textLabel?.text = "개발자 & 앱정보"
            cell.detailTextLabel?.text = "애플리케이션의 간단한 기능과 개발후기를 적었습니다."
        case 3:
            cell.textLabel?.text = "건의사항 & 앱평가"
            cell.detailTextLabel?.text = "원하는 기능이나 잘못된 부분을 리뷰에 남겨주세요."
        case 4:
            cell.textLabel?.text = "업데이트 정보확인"
            cell.detailTextLabel?.text = "건의사항, 앱평가의 의견을 받아 업데이트 된 내역을 확인합니다."
        default:
            cell.textLabel?.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            guard let colorSetViewController = self.storyboard?.instantiateViewController(withIdentifier: "ColorSetViewController") else { return }
            self.navigationController?.pushViewController(colorSetViewController, animated: true)
        case 1:
            guard let rightViewController = self.storyboard?.instantiateViewController(withIdentifier: "RightViewController") else { return }
            self.navigationController?.pushViewController(rightViewController, animated: true)
        case 2:
            guard let appInfoViewController = self.storyboard?.instantiateViewController(withIdentifier: "AppInfoViewController") else { return }
            self.navigationController?.pushViewController(appInfoViewController, animated: true)
        case 3:
            let url = "itms-apps://itunes.apple.com/app/id1535244189"
            if let url = URL(string: "\(url)"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil) }
                else {
                    UIApplication.shared.openURL(url)
                }
            }
        case 4:
            guard let updateLIstViewController = self.storyboard?.instantiateViewController(withIdentifier: "UpdateLIstViewController") else { return }
            self.navigationController?.pushViewController(updateLIstViewController, animated: true)
        default:
            return
        }
    }
}
