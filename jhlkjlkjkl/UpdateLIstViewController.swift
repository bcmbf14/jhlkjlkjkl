//
//  UpdateLIstViewController.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 10/11/20.
//

import UIKit


class UpdateLIstViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: InfoViewCell.identifier, bundle: nil), forCellReuseIdentifier: InfoViewCell.identifier)
        tableView.register(UINib(nibName: BasicCell.identifier, bundle: nil), forCellReuseIdentifier: BasicCell.identifier)
        tableView.separatorStyle = .none
        tableView.bounces = false
        title = "업데이트 정보확인"
    }
    
}

extension UpdateLIstViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "버전 1.0.0"
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: BasicCell.identifier, for: indexPath) as! BasicCell
            cell.selectionStyle = .none
            cell.contents.text = "앱스토어 출시"
            return cell
        case 2:
            cell.textLabel?.text = "버전 1.1.0"
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: BasicCell.identifier, for: indexPath) as! BasicCell
            cell.selectionStyle = .none
            cell.contents.text = "저작권 정보 추가\n데이터베이스 오탈자 수정\n개발자 & 앱정보 추가\n건의사항 & 앱평가 추가\n아이패드 지원"
            return cell
        case 4:
            cell.textLabel?.text = "버전 1.1.2"
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: BasicCell.identifier, for: indexPath) as! BasicCell
            cell.selectionStyle = .none
            cell.contents.text = "애플리케이션 재실행시 최근에 변경한 색상유지\n각 암기모드별 데이터 연동되도록 수정\n업데이트 정보확인화면 추가\n설정메뉴를 더보기메뉴로 탭이름변경"
            return cell
        case 6:
            cell.textLabel?.text = "버전 1.1.3"
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: BasicCell.identifier, for: indexPath) as! BasicCell
            cell.selectionStyle = .none
            cell.contents.text = "검색 키워드 수정"
            return cell
        default:
            return cell
        }
        return cell
    }
    
}
