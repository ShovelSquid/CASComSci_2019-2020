//
//  ViewController.swift
//  PhotoFilters
//
//  Created by Kaelen Cook on 3/4/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var selectButton: UIButton!
    
    var image: UIImage?
    
    var filters = ["Chrome", "Noir", "Process", "Tonal", "Instant", ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selectButton.addTarget(self, action: #selector(selectFilter), for: .touchUpInside)
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filters[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filters.count
    }
    

    
    @objc func selectFilter() {
        let inputImage = image!
        let row = pickerView.selectedRow(inComponent: 0)
        let selectedFilter = "CIPhotoEffect\(filters[row])"
        
        
        if let filter = CIFilter(name: selectedFilter) {
            let beginImage = CIImage(image: inputImage)
            filter.setDefaults()
            filter.setValue(beginImage, forKey: kCIInputImageKey)
            
            if let output = filter.outputImage {
                let processedImage = UIImage(ciImage: output, scale: 1, orientation: .down)
                imageView.image = processedImage
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        imageView.image = image
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

