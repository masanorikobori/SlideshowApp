//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Kobori on 2019/08/30.
//  Copyright © 2019 Masanori Kobori. All rights reserved.
//

import UIKit

//　プロパティ、イニシャライザ、メソッドの順で書くっぽい！


// クラス。一番上の階層
class ViewController: UIViewController {
    
    //UIimageViewをアウトレットした！
    @IBOutlet weak var UIImageView: UIImageView!
    
    
    // プロパティ
    var imageIndex = 0
    var timer: Timer!   //一定の間隔で処理を行うためのタイマー
    var timer_sec: Float = 0    // タイマー用の時間のための変数
    let images = [UIImage(named: "01.jpg"), UIImage(named: "02.jpg"), UIImage(named: "03.jpg")]     //写真の配列
    
    
    // これはメソッドになるの？？
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imageView = images[0]
        UIImageView.image = imageView
        
        // 遷移先ViewCntrollerの取得を書くっぽい
        //
        //
        
    }
    

    
    //戻るボタン
    @IBAction func backImage(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        UIImageView.image = images[imageIndex]
    }
    
    
    
    //再生と停止ボタン
    @IBAction func startStop(_ sender: Any) {
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
    }
    
    // timeInterval: 0.2 意味は？
    // target: self, 意味は？
    // selector: #selector(onTimer(_:)), 意味は？
    // userInfo: nil, 意味は？
    // repeats: true リピートするよという意味っぽい
    // self.timer.invalidate() で
    

    
    //進むボタン
    @IBAction func nextImage(_ sender: Any) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        UIImageView.image = images[imageIndex]
    }
    
    
    @objc func onTimer(_ timer: Timer) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        UIImageView.image = images[imageIndex]
    }
    



}

