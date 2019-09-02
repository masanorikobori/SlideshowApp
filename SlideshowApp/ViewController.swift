//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Kobori on 2019/08/30.
//  Copyright © 2019 Masanori Kobori. All rights reserved.
//

import UIKit

//　クラス→プロパティ→イニシャライザ→メソッドの順番にかく


// クラス。一番上の階層
class ViewController: UIViewController {
    
    //UIimageViewをアウトレットした！
    @IBOutlet weak var UIImageView: UIImageView!
    
    
    // プロパティ
    var imageIndex = 0
    var timer: Timer!   //一定の間隔で処理を行うためのタイマー
    var timer_sec: Float = 0    // タイマー用の時間のための変数
    let images = [UIImage(named: "01.jpg"), UIImage(named: "02.jpg"), UIImage(named: "03.jpg")]     //写真の配列？それとも辞書？
    

    // これはメソッドになるの？？
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
        func imageView() {
            let imageView = images[0]    // 表示している画像の番号から名前を取り出し
            // let image = UIImage(named: name)    // 画像を読み込み？？　■■■エラーになる
            UIImageView.image = imageView // Image Viewに読み込んだ画像をセット
        }
        
    }
    
    // 更新用関数になるのかな？(更新するために作った関数
    @objc func onTimer(_ timer: Timer) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        UIImageView.image = images[imageIndex]
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
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけタイマーを生成して動作させる
        if self.timer == nil {         // タイマーを設定
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)      //Timer.scheduledTimerでタイマーを作成、始動していて、その後の()に入っている記述は引数
            //nextImage.isEnabled = false     // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示 ■■■エラーになる
            //backImage.isEnabled = false    ■■■エラーになる
            //startStop.setTitle("停止", for: .normal)   // ボタンの名前を停止とする  ■■■エラーになる
        } else if self.timer != nil {
            // タイマーを停止
            self.timer.invalidate()
            // nil にして再び再生(nil の時にタイマー生成)
            self.timer = nil
            // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            //nextImage.isEnabled = true    ■■■エラーになる
            //backImage.isEnabled = true    ■■■エラーになる
            // ボタンの名前を再生とする
            //startStop.setTitle("再生", for: .normal)  ■■■エラーになる
        }
    }
    // startTimer() の timer == nil で判断するために、 timer = nil としておく
    //　A_ここまで
    // timeInterval: 1.0    1.0 秒ごとに更新されるタイマー
    // target: self,    ターゲットは自分(クラスのViewController.swift )を指す
    // selector: #selector(updateTimer(_:)      updateTimerを実行するように#selector(updateTimer(_:)と引数に指定している
    // userInfo: nil,   タイマーとして渡したい値が設定するけど、今回は不要なのでnil
    // repeats: true    trueなら呼び出し、falseなら一度の呼び出しで終了
    

    

    //進むボタン
    @IBAction func nextImage(_ sender: Any) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        UIImageView.image = images[imageIndex]
    }
    
    



}


