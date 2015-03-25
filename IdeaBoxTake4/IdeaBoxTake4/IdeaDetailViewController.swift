//
//  IdeaDetailViewController.swift
//  IdeaBoxTake4
//
//  Created by Samuel Kern on 3/24/15.
//  Copyright (c) 2015 Samuel Kern. All rights reserved.
//

import UIKit

class IdeaDetailViewController: UIViewController {

    var detailedIdea = Idea()
    
    @IBOutlet weak var UIideaName: UITextField!
    
    @IBOutlet weak var UIideaDescription: UITextField!
    
    @IBOutlet weak var UIstokeSlider: UISlider!
    
    override func viewWillAppear(animated: Bool) {
        println("Made it to viewWillAppear")
        //Do before view loads:
        UIideaName.text = detailedIdea.name         //Set title
        UIideaDescription.text = detailedIdea.description   //Set description
    }

    
    override func viewWillDisappear(animated: Bool) {
        //Save settings before view changes:
        detailedIdea.name = UIideaName.text
        detailedIdea.description = UIideaDescription.text
        //
    }
    
    
    

}
