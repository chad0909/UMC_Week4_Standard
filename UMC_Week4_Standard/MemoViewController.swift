//
//  MemoViewController.swift
//  UMC_Week4_Standard
//
//  Created by 077tech on 2022/10/12.
//

import UIKit

class MemoViewController: UIViewController {

    @IBAction func backbutton(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBOutlet weak var memoTitle: UILabel!
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        memoTitle.text = "\(number) 번째 메모입니다"
    }
    


 

}
