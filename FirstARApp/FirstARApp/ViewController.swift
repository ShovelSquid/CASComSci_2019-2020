//
//  ViewController.swift
//  FirstARApp
//
//  Created by Kaelen Cook on 3/9/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet weak var OurSceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        OurSceneView.delegate = self
        let scene = SCNScene(named: "arresources.scnassets/blank.scn")
        OurSceneView.scene = scene!
    }


}

