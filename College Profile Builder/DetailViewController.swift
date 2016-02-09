//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by kportillo on 1/26/16.
//  Copyright © 2016 kportillo. All rights reserved.
//

import SafariServices

class DetailViewController: UIViewController,SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    var college: College!
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        imagePicker.delegate = self
        nameTextField.text! = college.name //segues data into variable
        locationTextField.text! = college.location
        numberTextField.text! = String(college.numberOfStudents)
        myImageView.image = college.image
        websiteTextField.text! = college.webpage
        
        
    }
    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.numberOfStudents = Int(numberTextField.text!)!
        college.webpage = websiteTextField.text!
        
}
    
    @IBAction func websiteButtonTapped(sender: UIButton)
    {
        let myURL = NSURL(string: "https://" + (college.webpage))
        let svc = SFSafariViewController(URL: myURL!)
        svc.delegate = self
        presentViewController(svc, animated: true, completion: nil)
        
    }
    //allows you to leave page and return
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBAction func changeImageButtonTapped(sender: UIButton)
    {
        
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary //when button clicked, it brings us close to photo library
        presentViewController(imagePicker, animated: true, completion: nil) // brings you to photo library
        
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.myImageView.image = selectedImage //allows picture in library to appear on screen
            
        }


        
    }
    
    

        
    }
























    