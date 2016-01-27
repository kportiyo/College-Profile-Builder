//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by kportillo on 1/26/16.
//  Copyright © 2016 kportillo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    var college: College!
    
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        nameTextField.text! = college.name //segues data into variable
        locationTextField.text! = college.location
        numberTextField.text! = String(college.numberOfStudents)
        myImageView.image = college.image
        
        
    }
    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.numberOfStudents = Int(numberTextField.text!)!
        
}

}



    