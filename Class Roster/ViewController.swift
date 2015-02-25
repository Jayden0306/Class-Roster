//
//  ViewController.swift
//  Class Roster
//
//  Created by Jayden Tan on 2/19/15.
//  Copyright (c) 2015 JaydenT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //create a UILabel
    @IBOutlet weak var displayText: UILabel!
    
    //create a array of names
    var names = ["Joe", "Kevin", "Linda", "Mandy", "Nicky", "Orsca"]
    //initialize a start index when display a name
    var index = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //dispaly a name in the UILabel
        displayText.text = names[index]
        
    }
    
    @IBAction func leftPressed(sender: AnyObject) {
        //when left is pressed, index is decresing
        index--
        
        //re assign index to 0 if the index is less or equal to zero
        if index == 0 || index < 0 {
            index = 0
            displayText.text = names[index]
        } else {
           displayText.text = names[index]
        }
    }
    @IBAction func rightPressed(sender: AnyObject) {
        //when right is pressed, index is increasing
        index++
        let count = names.count-1
        //re assign index to last index 
        //when index is greater or equal to last index value
        if index == count || index > count{
            index = count
            displayText.text = names[index]
        } else {
            displayText.text = names[index]
        }
    }
}

