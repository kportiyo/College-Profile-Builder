//
//  College.swift
//  College Profile Builder
//
//  Created by kportillo on 1/21/16.
//  Copyright © 2016 kportillo. All rights reserved.
//

import UIKit

class College: NSObject
{
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "Default")
    var webpage = ""
   
    init(Name: String, Location: String, NumberOfStudents: Int, Webpage: String, Image: UIImage)
    {
        super.init()
        name = Name
        location = Location
        numberOfStudents = NumberOfStudents
        webpage = Webpage
        image = Image
        
}
    init(Name: String, Location: String, NumberOfStudents: Int, Webpage: String)
    {
        super.init()
        name = Name
        location = Location
        numberOfStudents = NumberOfStudents
        webpage = Webpage
        
    }
    
    
    
}



