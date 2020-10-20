//
//  AppInfoViewController.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 10/11/20.
//

import UIKit


class AppInfoViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: InfoViewCell.identifier, bundle: nil), forCellReuseIdentifier: InfoViewCell.identifier)
        tableView.register(UINib(nibName: BasicCell.identifier, bundle: nil), forCellReuseIdentifier: BasicCell.identifier)
        tableView.separatorStyle = .none
        tableView.bounces = false
        title = "개발자 & 앱정보"
    }
    
    
    private func readCurrentAppVersion() -> String{
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { return "버전 확인에 실패하였습니다."}
        return version
    }
    
    
    private func readAppStoreAppVersion() -> String{
        guard let url = URL(string: "http://itunes.apple.com/lookup?id=1535244189"),
              let data = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
              let results = json["results"] as? [[String: Any]],
              results.count > 0,
              let appStoreVersion = results[0]["version"] as? String
        else { return "버전 확인에 실패하였습니다."}
        return appStoreVersion
    }
}

extension AppInfoViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoViewCell.identifier, for: indexPath) as! InfoViewCell
        cell.selectionStyle = .none
        
        switch indexPath.row {
        case 0:
            cell.titleLabel?.text = "앱 이름"
            cell.detailLabel?.text = "내가 쓰려고 만든 정보처리기사(실기)"
        case 1:
            cell.titleLabel?.text = "현재 버전"
            cell.detailLabel?.text = readCurrentAppVersion()
        case 2:
            cell.titleLabel?.text = "최신 버전"
            cell.detailLabel?.text = readAppStoreAppVersion()
        case 3:
            cell.titleLabel?.text = "개발자 한마디"
            cell.detailLabel.text = ""
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: BasicCell.identifier, for: indexPath) as! BasicCell
            cell.selectionStyle = .none
            cell.contents.text = "안녕하세요~개발자입니다. 앱이 좀 허술하죠?^^;; 대충 만들어서 그래요. 사실 저도 이번에 2020년 3회차 정보처리기사 실기시험을 앞두고 있습니다. 모두 좋은 소식이 있기를 바래봅니다. 이 앱은 사실 수제비측에서 퀴즐렛 애플리케이션도 제공을 하고는 있지만, 수제비 책에 있는 '두음암기법'을 효과적으로 암기하기 위해서 만들게 되었어요. 두음만 빠르게 외우거나 암기한 것을 테스트 할 수 있도록 메뉴도 여러개로 나름대로 나눠보았답니다. 앱의 사용방법은 억지로라도(사실 제이야기..) 자주 사용할 수 있도록 탭만으로 움직이게 해놓았구요. 안에 있는 색상들은 나름대로 보색을 활용해서 제일 가시성이 좋을만한 색들로 골라보았습니다. 1.1.0버전부터는 아이패드도 지원합니다. 이 앱이 도움이 되실지는 모르겠으나, 그저 유용하게 사용해주시면 감사하겠습니다. 이상입니다."
            return cell
        default:
            return cell
        }
        
        return cell
    }
    
}
