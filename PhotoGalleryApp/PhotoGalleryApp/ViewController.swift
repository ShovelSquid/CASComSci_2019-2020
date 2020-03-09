//
//  ViewController.swift
//  PhotoGalleryApp
//
//  Created by Kaelen Cook on 3/6/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var toolbarButton: UIBarButtonItem!
    @IBOutlet var TheView: UIView!
    
    var image: UIImage?
    
    var contentHeight:CGFloat = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: 0, height: 0)
        stackView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
    }
    
    func addImage(ommage: UIImage) {
        let newImageView = UIImageView()
        newImageView.contentMode = .scaleAspectFill
        newImageView.frame = CGRect(x: 0, y: 0, width: TheView.frame.width, height: 500)
        newImageView.image = ommage
        stackView.addArrangedSubview(newImageView)
        
        contentHeight += 500
        stackView.frame = CGRect(x: 0, y: 0, width: TheView.frame.width, height: contentHeight)
        scrollView.contentSize = CGSize(width: TheView.frame.width, height: contentHeight)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        
        image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        addImage(ommage: image!)
    }

    @IBAction func launchPhotoPicker(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
}

