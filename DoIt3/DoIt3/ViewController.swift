//
//  ViewController.swift
//  DoIt3
//
//  Created by GSM04 on 2021/06/25.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom = false //확대여부를 나타내는 함수
    var imgOn: UIImage? //켜진 전구 이미지가 있는 UIImage 타입의 함수
    var imgOff: UIImage? //꺼진 전구 이미지가 있는 UIImage 타입의 함수
    

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if(isZoom){
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
        }
        else {
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
        
    }
    
    @IBAction func switchImageOff(_ sender: UISwitch) {
        
        if sender.isOn{
            imgView.image = imgOn
        }
        else{
            imgView.image = imgOff
        }
        
    }
    
}

