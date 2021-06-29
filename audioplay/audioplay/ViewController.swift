//
//  ViewController.swift
//  audioplay
//
//  Created by GSM04 on 2021/06/29.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var audioPlayer: AVAudioPlayer!
    var audioFile: URL!
    var MAX_VOLUME: Float = 10.0
    var progressTimer: Timer!
    
    let timePlayerSelector: Selector = #selector(ViewController.updatePlayTime)

    @IBOutlet var pvProgressPlay: UIProgressView!
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblEndTime: UILabel!
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var btnPause: UIButton!
    @IBOutlet var btnStop: UIButton!
    @IBOutlet var slVolume: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioFile = Bundle.main.url(forResource: "IZ ONE 아이즈원   Parallel Universe (평행우주)   Lyrics (ColorCoded ENG HAN ROM 가사)", withExtension: "mp3")
        
        initPlay()
    }
    
    func initPlay() {
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        } catch let error as NSError {
            print("ERROR-initPlay : \(error)")
        }
        
        slVolume.maximumValue = MAX_VOLUME
        slVolume.value = 1.0
        pvProgressPlay.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value
        
        lblEndTime.text = convertNSTimeInterval2String(audioPlayer.duration)
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        btnPlay.isEnabled = true
        btnStop.isEnabled = false
        btnPause.isEnabled = false
        setPlayButtons(true, pause: false, stop: false)
    }
    
    func setPlayButtons(_ play: Bool, pause: Bool, stop: Bool) {
        btnPlay.isEnabled = play
        btnStop.isEnabled = stop
        btnPause.isEnabled = pause
    }
    
    func convertNSTimeInterval2String(_ time: TimeInterval) -> String{
        
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
        
    }
    
    @objc func updatePlayTime() {
        lblCurrentTime.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    
    @IBAction func btnPlayAudio(_ sender: UIButton) {
        
        audioPlayer.play()
        setPlayButtons(false, pause: true, stop: true)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
        
    }
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        
        audioPlayer.pause()
        setPlayButtons(true, pause: false, stop: true)
        
    }
    @IBAction func btnStopAudio(_ sender: UIButton) {
        
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(true, pause: false, stop: false)
        progressTimer.invalidate()
        
    }
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = slVolume.value
    }
}

