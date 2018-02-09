//
//  PostViewController.swift
//  Instagram
//
//  Created by NICK on 2/8/18.
//  Copyright © 2018 NICK. All rights reserved.
//

import UIKit
import Parse
import ParseLiveQuery



class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionField: UITextField!
    // initialize the following variables
    var captionPost = ""
    var imagePost = UIImage(named: "imageName")
    var alertController = UIAlertController(title: "New Post", message: nil, preferredStyle: .actionSheet)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Creates post options
        let takePhotoAction = UIAlertAction(title: "Take Photo", style: .default) { (action) in
            self.imagePickerLaunch(source: .camera)
        }
        alertController.addAction(takePhotoAction)
        let libImportAction = UIAlertAction(title: "Choose from Library", style: .default) { (action) in
            self.imagePickerLaunch(source: .photoLibrary)
        }
        alertController.addAction(libImportAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            self.tabBarController?.selectedIndex = 0
        }
    }
    
    func imagePickerLaunch(source: UIImagePickerControllerSourceType){
        // vc: view controller of image picker
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        
        if source == .camera {
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                print("Camera is available 📸")
                vc.sourceType = .camera
            } else {
                // add alert here to say camera not available
                print("Camera 🚫 available so we will use photo library instead")
                vc.sourceType = .photoLibrary
            }
        }
        else {
            vc.sourceType = .photoLibrary
        }
        
        self.present(vc, animated: true, completion: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        if self.imagePost == UIImage(named: "imageName") {
            self.imagePost = UIImage(named: "imageName")
            self.captionPost = ""
            present(alertController, animated: true)
        }
    }
    
    // shared a new post
    @IBAction func onShare(_ sender: Any) {
      //  MBProgressHUD.showAdded(to: self.view, animated: true)
        captionPost = captionField.text ?? ""
        
        Post.postUserImage(image: imagePost, withCaption: captionPost) { (status: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Post successful")
         //       MBProgressHUD.hide(for: self.view, animated: true)
                //Goes back to feed after posting
                self.tabBarController?.selectedIndex = 0
                //Reset photo selected
                self.imagePost = UIImage(named: "imageName")
                self.captionPost = ""
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Do something with the images (based on your use case)
        imageView.image = resize(image: editedImage, newSize: CGSize(width: 640,height: 640))
        imagePost = resize(image: editedImage, newSize: CGSize(width: 640,height: 640))
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    
    // resize image to accomodate parse
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        resizeImageView.contentMode = UIViewContentMode.scaleAspectFill
        resizeImageView.image = image
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
