//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 坂本充生 on 2020/06/21.
//  Copyright © 2020 michio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let picName:[String] = ["spring","summer","autumn","winter"]
    var step:Int = 0        //配列の番号
    var timer: Timer!
    
    
    @IBOutlet weak var playButtonView: UIButton!
    @IBOutlet weak var nextButtonView: UIButton!
        
    @IBOutlet weak var returnButtonView: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        step = 0
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: picName[step])
        playButtonView.setTitle("再生", for: .normal)
        // Do any additional setup after loading the view.
//        print(picName[1])
    }
    
    //画像のタップ処理
    override func prepare(for segue: UIStoryboardSegue,sender : Any?){
        //スライドショーの停止
//        playButton()
        if self.timer != nil{
            self.timer.invalidate()
            self.timer = nil
            nextButtonView.isEnabled = true
            returnButtonView.isEnabled = true
            playButtonView.setTitle("再生", for: .normal)
        }
        
        //画面遷移
        let nextViewController :NextViewController = segue.destination as! NextViewController
        nextViewController.picName = self.picName
        nextViewController.step = self.step
    }
    
    @IBAction func unwind(_ sefue: UIStoryboardSegue){
        
    }
    //進むボタン
    @IBAction func nextButton(_ sender: Any) {
        if self.timer == nil{       //再生時はEnableにしているが念のため
            if step == 3 {
                step = 0
            }else{
                step += 1
            }
            funcViewImage(arrayNo: step)
        }
    }
    //戻るボタン
    @IBAction func returnButton(_ sender: Any) {
        if self.timer == nil{       //再生時はEnableにしているが念のため
            if step == 0 {
                step = 3
            }else{
                step -= 1
            }
            funcViewImage(arrayNo: step)
        }
        
    }
    
    //再生/一時停止ボタン
    @IBAction func playButton(_ sender: Any) {
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            nextButtonView.isEnabled = false
            returnButtonView.isEnabled = false
            playButtonView.setTitle("停止", for: .normal)
        }else{
            self.timer.invalidate()
            self.timer = nil
            nextButtonView.isEnabled = true
            returnButtonView.isEnabled = true
            playButtonView.setTitle("再生", for: .normal)
        }
    }
    
    @objc func updateTimer(_ timer:Timer){
        if step == 3 {
            step = 0
        }else{
            step += 1
        }
        funcViewImage(arrayNo: step)
    }
    
    func funcViewImage(arrayNo :Int){
        imageView.image = UIImage(named: picName[arrayNo])
    }
}

