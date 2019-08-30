//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Kobori on 2019/08/30.
//  Copyright © 2019 Masanori Kobori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //UIimageViewをアウトレットした！
    @IBOutlet weak var UIImageView: UIImageView!
    
    var imageIndex = 0
    
    var timer: Timer!
    
    //写真の配列
    let images = [UIImage(named: "photo01"), UIImage(named: "photo02"), UIImage(named: "photo03")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imageView = images[0]
        UIImageView.image = imageView
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

