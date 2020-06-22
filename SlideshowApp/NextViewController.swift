//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by 坂本充生 on 2020/06/21.
//  Copyright © 2020 michio. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    var picName:[String] = []
    var step:Int = 0
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(picName)
        print(step)
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: picName[step])
    }
    

    @IBAction func backButtoon(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
