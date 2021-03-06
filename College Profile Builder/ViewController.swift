//
//  ViewController.swift
//  College Profile Builder
//
//  Created by kportillo on 1/20/16.
//  Copyright © 2016 kportillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    var colleges: [College] = []
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        colleges.append(College(Name: "UIC", Location: "Chicago, Illinois",  NumberOfStudents: 29000, Webpage: "www.uic.edu/", Image: UIImage(named: "Default")!))
        colleges.append(College(Name: "U of I", Location: "Champaign, Illinois", NumberOfStudents: 44087, Webpage: "illinois.edu/", Image: UIImage(named: "UofI")!))
        colleges.append(College(Name: "University of Wisconsin-Madison!", Location: "Madison, Wisconsin", NumberOfStudents: 43193, Webpage: "wisc.edu/", Image: UIImage(named: "wisconsinMadison")!))
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = colleges[indexPath.row].name
        myTableViewCell.detailTextLabel?.text = colleges[indexPath.row].location
        return myTableViewCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
        
    }
    
    
    @IBAction func editButton(sender: UIBarButtonItem)
    {
         myTableView.editing = !myTableView.editing
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add college!", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let nameTextField = myAlert.textFields! [0] as UITextField
            let locationTextField = myAlert.textFields! [1] as UITextField
            let websiteTextField = myAlert.textFields! [2] as UITextField
            let numberTextField = myAlert.textFields! [3] as UITextField
            

            
            self.colleges.append(College(Name: nameTextField.text!, Location: locationTextField.text!, NumberOfStudents: Int(numberTextField.text!)!, Webpage: websiteTextField.text!))
            self.myTableView.reloadData()
        }

        myAlert.addAction(addAction)
        
        myAlert.addTextFieldWithConfigurationHandler { (nameTextField) -> Void in
            nameTextField.placeholder = "Add a college!"
            
        }
        
        myAlert.addTextFieldWithConfigurationHandler { (websiteTextField) -> Void in
            websiteTextField.placeholder = "Add location!"
            
        }

        
        myAlert.addTextFieldWithConfigurationHandler { (locationTextField) -> Void in
            locationTextField.placeholder = "Add URL!"
            
        }
        
        myAlert.addTextFieldWithConfigurationHandler { (numberTextField) -> Void in
            numberTextField.placeholder = "Add # of students!"
            
        }

        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailVC = segue.destinationViewController as! DetailViewController
        let selectRow = myTableView.indexPathForSelectedRow?.row
        detailVC.college = colleges[selectRow!]
    }
    
    
        
        }


