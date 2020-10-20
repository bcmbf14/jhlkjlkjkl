//
//  RightViewController.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 10/11/20.
//

import UIKit



class RightViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: InfoViewCell.identifier, bundle: nil), forCellReuseIdentifier: InfoViewCell.identifier)
        tableView.register(UINib(nibName: BasicCell.identifier, bundle: nil), forCellReuseIdentifier: BasicCell.identifier)
        tableView.separatorStyle = .none
        tableView.bounces = false
        title = "저작권 정보"
    }
    
}

extension RightViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "AppIcon & LaunchScreen Image"
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: BasicCell.identifier, for: indexPath) as! BasicCell
            cell.selectionStyle = .none
            cell.contents.text = "Icons made by Nikita Golubev\nhttps://www.flaticon.com/authors/nikita-golubev\n\nFrom Flaticon\n\nhttps://www.flaticon.com/"
            return cell
        case 2:
            cell.textLabel?.text = "두음암기 관련 데이터 전체"
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: BasicCell.identifier, for: indexPath) as! BasicCell
            cell.selectionStyle = .none
            cell.contents.text = "사용한 데이터\n\n시험에 자주 나오는 빈출 문제를 대상으로 반드시 암기해야 할 필수 요소에 대해 두음으로 쉽게 암기할 수 있도록 ‘핵심 키워드’를 정리한 두음 암기법\n\n자료출처\n\n수제비 2020 - 수험생 입장에서 제대로 쓴 비법서\n정보처리기사 실기\n지은이 NCS 정보처리기술사 연구회(윤영빈, 서용욱, 김학배 공저)\n발행인 차승녀\n편집,제작 웅보출판사\n표지디자인 웅보출판사\n공급처 도서출판 건기원\n\n앱출시 전 자문\n\n이 앱은 앱스토어에 첫출시 하기 전, 수제비 공식카페(https://cafe.naver.com/soojebi)를 통하여 저작권 관련 앱을 출시해도 된다는 답글을 받고 출시하였습니다.\n\n관련정보\n\n그것이 알고싶다 카테고리\n정처기-실기질문\n25712, 2020.10.10, 01:39\n작성자 허허하우구\n답글 카페지기\n안녕하세요? 카페지기입니다.\n두음쌤도 저작권이 있습니다.\n다만 커뮤니티에 공개된 상태고 상업적 목적 외에 출처가 명시되어 있다면 괜찮다는 의견입니다. 나중에 오픈되어 공유주시면 좋겠습니다 ^_^"
            return cell
        default:
            return cell
        }
        return cell
    }
    
}
