//
//  NewIdeaViewController.swift
//  IdeaBoxTake2
//
//  Created by Samuel Kern on 2/23/15.
//  Copyright (c) 2015 Samuel Kern. All rights reserved.
//

import UIKit

class NewIdeaViewController: UIViewController {

    
    @IBOutlet weak var newIdeaTitle: UITextField!
    
    
    @IBOutlet weak var newIdeaDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
