//
//  Photo.swift
//  College Profile Builder
//
//  Created by kportillo on 2/8/16.
//  Copyright © 2016 kportillo. All rights reserved.
//

import UIKit

class Photo: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var myImageView: UIImageView!
    let myImagePicker = UIImagePickerController()
    var myPhotos: [UIImage] = []
    var counter = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myImagePicker.delegate = self
        myImagePicker.allowsEditing = true
        NSTimer.scheduledTimerWithTimeInterval(4.0, target: self, selector: "nextPhoto", userInfo: nil, repeats: true)
    }

    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        
        let mySheet = UIAlertController(title: "Add from...", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        mySheet.addAction(UIAlertAction(title: "Photo Library", style: .Default, handler: { (libraryAction) -> Void in
            self.myImagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(self.myImagePicker, animated: true, completion: nil)
        }))
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            mySheet.addAction(UIAlertAction(title: "Camera!", style: .Default, handler: { (cameraAction) -> Void in
                self.myImagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                self.presentViewController(self.myImagePicker, animated: true, completion: nil)
            }))
        }
        presentViewController(mySheet, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        myImagePicker.dismissViewControllerAnimated(true) { () -> Void in
            self.myPhotos.append(info[UIImagePickerControllerEditedImage] as! UIImage)
        }
        
    }
    
    
    func nextPhoto() // *****
    {
        print("Photos:" , myPhotos.count)
        print("Counter:", counter)
        
        
        if myPhotos.count > 0
        {
            if counter < myPhotos.count - 1 && myPhotos.count != 1
            {
                counter++
            }
            else
            {
                counter = 0
            }
            
            
            myImageView.image = myPhotos[counter]
        }

    }
    
    

}
