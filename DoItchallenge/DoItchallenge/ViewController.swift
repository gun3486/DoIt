//
//  ViewController.swift
//  DoItchallenge
//
//  Created by GSM04 on 2021/06/25.
//

import UIKit

var imgNum = 0

class ViewController: UIViewController {
    
    
    
    var imgName = ["1.png","2.png", "3.png", "4.png", "5.png", "6.png"]

    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: imgName[0])
    }

    @IBAction func btnPrev(_ sender: UIButton) {
        imgNum = imgNum - 1
        
        if (imgNum < 0){
            imgNum = imgName.count - 1
        }
        imgView.image = UIImage(named: imgName[imgNum])
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        imgNum = imgNum + 1
        
        if (imgNum >= imgName.count){
            imgNum = 0
        }
        imgView.image = UIImage(named: imgName[imgNum])
    }
}

