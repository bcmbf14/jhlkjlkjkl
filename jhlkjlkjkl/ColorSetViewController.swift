//
//  ColorSetViewController.swift
//  jhlkjlkjkl
//
//  Created by jc.kim on 10/9/20.
//

import UIKit


class ColorSetViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var baseColor = appDelegate.baseColor
    lazy var highlightColor = appDelegate.highlightColor
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: ColorSetCell.identifier, bundle: nil), forCellReuseIdentifier: ColorSetCell.identifier)
        tableView.separatorStyle = .none
        tableView.bounces = false
        title = "색상대비값 변경"
    }
    
    
    
    
}

extension ColorSetViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ColorSetCell.identifier, for: indexPath) as! ColorSetCell
        
        switch indexPath.row {
        case 0:
            cell.baseColorButton.backgroundColor = .purple
            cell.highlightButton.backgroundColor = .green
        case 1:
            cell.baseColorButton.backgroundColor = .blue
            cell.highlightButton.backgroundColor = .yellow
        case 2:
            cell.baseColorButton.backgroundColor = .orange
            cell.highlightButton.backgroundColor = .blue
        case 3:
            cell.baseColorButton.backgroundColor = .magenta
            cell.highlightButton.backgroundColor = .green
        case 4:
            cell.baseColorButton.backgroundColor = .red
            cell.highlightButton.backgroundColor = .cyan
        default:
            break;
        }
        
        cell.handler = {
            
            switch indexPath.row {
            case 0:
                self.baseColor = .purple
                self.highlightColor = .green
                UserDefaults.standard.set(indexPath.row, forKey: "baseColorCode")
                UserDefaults.standard.set(indexPath.row, forKey: "highlightColorCode")
            case 1:
                self.baseColor = .blue
                self.highlightColor = .yellow
                UserDefaults.standard.set(indexPath.row, forKey: "baseColorCode")
                UserDefaults.standard.set(indexPath.row, forKey: "highlightColorCode")
            case 2:
                self.baseColor = .orange
                self.highlightColor = .blue
                UserDefaults.standard.set(indexPath.row, forKey: "baseColorCode")
                UserDefaults.standard.set(indexPath.row, forKey: "highlightColorCode")
            case 3:
                self.baseColor = .magenta
                self.highlightColor = .green
                UserDefaults.standard.set(indexPath.row, forKey: "baseColorCode")
                UserDefaults.standard.set(indexPath.row, forKey: "highlightColorCode")
            case 4:
                self.baseColor = .red
                self.highlightColor = .cyan
                UserDefaults.standard.set(indexPath.row, forKey: "baseColorCode")
                UserDefaults.standard.set(indexPath.row, forKey: "highlightColorCode")
            default:
                break;
            }
            
//            self.appDelegate.baseColor = self.baseColor
//            self.appDelegate.highlightColor = self.highlightColor
            self.navigationController?.popViewController(animated: true)
            
        }
        
        return cell
    }
    
}
