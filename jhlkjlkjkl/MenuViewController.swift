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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    

}


extension MenuViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
    
    
    
    
}
