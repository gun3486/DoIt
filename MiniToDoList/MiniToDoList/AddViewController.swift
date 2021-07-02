//
//  AddViewController.swift
//  MiniToDoList
//
//  Created by GSM04 on 2021/07/02.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnAddItem(_ sender: UIButton) {
        
        items.append(tfAddItem.text!)
        itemsImageFile.append("clock.png")
        tfAddItem.text=""
        _ = navigationController?.popViewController(animated: true)
        
    }
}
