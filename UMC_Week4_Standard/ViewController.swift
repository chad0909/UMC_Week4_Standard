//
//  ViewController.swift
//  UMC_Week4_Standard
//
//  Created by 077tech on 2022/10/12.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var tableview: UITableView!
    
    var dataArray: Array<String> = ["ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", "ㅡㅡㅡ", ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        tableview.dataSource = self
        tableview.delegate = self
        
    }
    private func registerXib() {
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableview.register(nibName, forCellReuseIdentifier: "cell")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "MemoView"{
                if let destination = segue.destination as?
                    MemoViewController {
                    if let selectdeIndex =
                        self.tableview.indexPathForSelectedRow?.row {
                        destination.number = selectdeIndex + 1
                    }
                }
            }
        }
    
}


extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        cell.number.text = String(indexPath.row + 1)
        if indexPath.row % 5 == 0{
            cell.backgroundColor = .black
        }else{
            cell.backgroundColor = .white
        }
        
        let background = UIView()
        background.backgroundColor = .clear
        cell.selectedBackgroundView = background
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "MemoView", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            
            let like = UIContextualAction(style: .normal, title: "Like") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
                print("Like 클릭 됨")
                success(true)
            }
            like.backgroundColor = .systemPink
            
            let share = UIContextualAction(style: .normal, title: "Share") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
                print("Share 클릭 됨")
                success(true)
            }
            share.backgroundColor = .systemTeal

            return UISwipeActionsConfiguration(actions:[like, share])
            
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            
        }
    }

    
    
}
