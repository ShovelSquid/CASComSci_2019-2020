//
//  GameVC.swift
//  PolygonGuesserGame
//
//  Created by Kaelen Cook on 2/12/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var buttonAmt:Int = 17
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        makeButtons(count: buttonAmt)
    }
    
    func makeButtons(count: Int) {
        for i in 1...count {
            let newButton = UIButton()
            newButton.setTitle("Button \(i)", for: .normal)
            newButton.backgroundColor = UIColor(displayP3Red: 1, green: 0, blue: 0, alpha: 0)
            newButton.frame = CGRect(x: 0, y: 0, width: 250, height: 30)
            newButton.addTarget(self, action: #selector(addAlert), for: .touchUpInside)
            stackView.addArrangedSubview(newButton)
        }
        stackView.frame = CGRect(x: 0, y: 0, width: 250, height: 30*count)
    }
    
    @objc func addAlert() {
        return
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
