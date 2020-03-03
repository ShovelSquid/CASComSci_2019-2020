//
//  ViewController.swift
//  FirstCameraApp
//
//  Created by Kaelen Cook on 2/20/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var buttonImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.addTarget(self, action: #selector(takePhoto), for: .touchUpInside)
        button.addTarget(self, action:#selector(beingPressed), for: .touchDown)
        buttonImageView.image = UIImage(named: "IMG_0797")
    }

    @objc func takePhoto() {
        switch AVCaptureDevice.authorizationStatus(for:.video) {
        case .authorized:
            self.setupCaptureSession()
        
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    self.setupCaptureSession()
                }
            }
            
        case .denied:
            return
        
        case .restricted:
            return
            
        default:
            return
        }
        
        buttonImageView.image = UIImage(named: "IMG_0797")
    }
    
    @objc func beingPressed() {
        buttonImageView.image = UIImage(named:"IMG_0796")
    }
    
    func setupCaptureSession() {
        print("HARDE HARDE HAR")
    }

}


