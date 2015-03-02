//
//  PersonDetailViewController.swift
//  Class Roster
//
//  Created by Jayden Tan on 3/1/15.
//  Copyright (c) 2015 JaydenT. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    var selectedPerson = Person(firstName: "Dummy", lastName: "Dummy")
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.selectedPerson.firstName
        firstName.text = self.selectedPerson.firstName
        lastName.text = self.selectedPerson.lastName
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
