//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Kobori on 2019/08/30.
//  Copyright © 2019 Masanori Kobori. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //拡大画像を表示する
    @IBOutlet weak var bigImageView: UIImageView!
    
    //受け取るためのプロパティ
    var image: UIImage!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //イメージビュー
        bigImageView.image = self.image

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
