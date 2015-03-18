//
//  PersonDetailViewController.swift
//  Class Roster
//
//  Created by Jayden Tan on 3/1/15.
//  Copyright (c) 2015 JaydenT. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //create a cocoa touch class because it will implement all the method for you
    //the swift will provide you a blank page
    //it only has the format different
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var selectedPerson = Person(firstName: "Dummy", lastName: "Dummy")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.selectedPerson.firstName
        self.firstNameLabel.delegate = self
        self.lastNameLabel.delegate = self
        self.firstNameLabel.text = self.selectedPerson.firstName
        self.lastNameLabel.text = self.selectedPerson.lastName
        
        if self.selectedPerson.image != nil {
            self.imageView.image = self.selectedPerson.image
        }
//        else {
//            self.imageView.image = UIImage (named: "placeholder.jpg")
//        }
        
    }
    
    @IBAction func photoButtonPressed(sender: AnyObject) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        //take the user to their photo library
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        //prsent view controller is inherited from the UIViewController
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as UIImage
        self.imageView.image = image
        self.selectedPerson.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.selectedPerson.firstName = self.firstNameLabel.text
        self.selectedPerson.lastName = self.lastNameLabel.text
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //this line is dimiss the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
         picker.dismissViewControllerAnimated(true, completion: nil)
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
