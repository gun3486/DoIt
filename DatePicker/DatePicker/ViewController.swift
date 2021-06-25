//
//  ViewController.swift
//  DatePicker
//
//  Created by GSM04 on 2021/06/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd HH:mm EEE"
        lblPickerTime.text =
            "선택시간:" + formatter.string(from: datePickerView.date)
    }
    
}

