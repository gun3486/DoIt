//
//  DetailViewController.swift
//  MiniToDoList
//
//  Created by GSM04 on 2021/07/02.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receiveItem = ""
    
    @IBOutlet var lblItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblItem.text = receiveItem
        
    }
    
    func receiveItem(_ item: String) {
        receiveItem = item
    }

}
