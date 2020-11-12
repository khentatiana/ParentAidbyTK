//
//  CameraViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/11/20.
//

import UIKit
import AlamofireImage
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var eventField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSubmitButton(_ sender: Any) {
        // Create new object "post" that will be stored in table "Posts"
                let event = PFObject(className: "KidsEvents")
                //create arbitrary key "caption", "author"
                event["synopsis"] = eventField.text!
                //author of the post will be current user
        event["provider"] = PFUser.current()!
                
                
                let imageData = imageView.image!.pngData()
                let file = PFFileObject(data: imageData!)
        event["image"] = file
                //save the object ("post")to the table
        event.saveInBackground{(success, error) in
                    if success {
                        self.dismiss(animated: true, completion: nil)
                        print("Saved!!!")
                    } else {
                        print ("Error!!!")
                    }
            }

    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
                picker.delegate = self
                picker.allowsEditing = true
                //check if camera is available, if not then use photoLibrary
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    picker.sourceType = .camera
                    
                }else {
                    picker.sourceType = .photoLibrary
                }
                present(picker, animated: true, completion: nil)
                }
    //function to display image
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           let image = info [.editedImage] as! UIImage
           let size = CGSize(width: 300, height: 300)
            let scaledImage = image.af_imageAspectScaled(toFill: size)
    
    
           
           imageView.image = scaledImage
           //dismiss camera view
           dismiss(animated: true, completion: nil)
       }
       }


   
