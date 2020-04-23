//
//  ImageViewController.swift
//  LayoutExcercise
//
//  Created by Kaelen Cook on 1/29/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    var buttonColor = UIColor.systemGreen
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func pressing(_ sender: Any) {
        button.backgroundColor! = UIColor.white
        button.tintColor! = UIColor.gray
    }
    
    @IBAction func pressed(_ sender: Any) {
        button.backgroundColor! = buttonColor
        button.tintColor! = UIColor.white
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
