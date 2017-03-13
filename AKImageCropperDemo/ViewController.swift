//
//  ViewController.swift
//  AKImageCropperDemo
//  GitHub: https://github.com/artemkrachulov/AKImageCropper
//
//  Created by Krachulov Artem
//  Copyright (c) 2015 Krachulov Artem. All rights reserved.
//  Website: http://www.artemkrachulov.com/
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Components
    //         _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
    
    @IBOutlet var galleryBuuton: UIButton!
    @IBOutlet var demoFolderBuuton: UIButton!
    var imagePicker = UIImagePickerController()
}

// MARK: - UIImagePickerControllerDelegate
//         _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBAction func galleryBuutonClicked(){        
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum){
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            imagePicker.navigationBar.isTranslucent = false
            imagePicker.navigationBar.barStyle = .black
            imagePicker.navigationBar.tintColor = UIColor.white
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "cropper-vc") as! CropperViewController
                vc._image = pickedImage
            
            picker.pushViewController(vc, animated: true)
        }        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
}

