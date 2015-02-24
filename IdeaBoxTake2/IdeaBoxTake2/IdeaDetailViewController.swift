//
//  IdeaDetailViewController.swift
//  IdeaBoxTake2
//
//  Created by Samuel Kern on 2/23/15.
//  Copyright (c) 2015 Samuel Kern. All rights reserved.
//

import UIKit

class IdeaDetailViewController: UIViewController {

    
    var idea = Idea()
    
    @IBOutlet weak var ideaTitle: UITextField!
    
    @IBOutlet weak var ideaDescription: UITextView!
    
    
    
    override func viewWillAppear(animated: Bool) {
        ideaTitle.text = idea.title
        ideaDescription.text = idea.description
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        idea.title = ideaTitle.text
        idea.description = ideaDescription.text
    }
    
    
    
    
    
    
    
    
    
    
    
    
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
