import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    var alarm: String?
    var current: String?
    
    @IBOutlet var lblCrtTime: UILabel!
    @IBOutlet var lblAlarmTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func selectTime(_ sender: UIDatePicker) {
        let selectTime = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        lblAlarmTime.text = "선택시간:" + formatter.string(from: selectTime.date)
        
        alarm = formatter.string(from: selectTime.date)
    }
    
    @objc func updateTime(){
        
        let date = NSDate()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCrtTime.text = "현재시간: " + formatter.string(from: date as Date)
        
        current = formatter.string(from: date as Date)
        
        if (alarm == current){
            view.backgroundColor = UIColor.red
        }
        else {
            view.backgroundColor = UIColor.white
        }
    }
}

