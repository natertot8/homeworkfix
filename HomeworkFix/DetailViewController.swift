//
//  DetailViewController.swift
//  HomeworkFix
//
//  Created by Nathan Ma on 8/23/14.
//  Copyright (c) 2014 Nathan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var DTPersonProfile : Person!
    
    var gitHubResourcePath = "https://api.github.com/users/"
    
    var alertTextField: UITextField!
    
    
    @IBOutlet weak var imageView: UIImageView!
   
    
    @IBOutlet weak var textfirstName: UITextField!
    
    
    @IBOutlet weak var textlastName: UITextField!
    
    
    @IBOutlet weak var gitHubUserName: UITextField!
    
    
    @IBOutlet weak var gitHubPic: UIImageView!
    
    
    @IBAction func gitButton(sender: AnyObject) {println ("BOOM!")
        var alert = UIAlertController(title: "GitHub", message: "What's your GitHub Username?", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "GitHub Username"
            self.alertTextField = textField!
            println (self.alertTextField.text)
    })
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK!", style: UIAlertActionStyle.Default) { (alertAction:UIAlertAction!) in
            if self.alertTextField.text != nil {
                self.gitHubUserName.text = self.alertTextField.text}
        
    })

        self.presentViewController(alert, animated: true, completion: nil)
    }



    
//MARK: View Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.layer.cornerRadius = 100.0
        self.imageView.layer.masksToBounds = true
        self.imageView.layer.borderWidth = 1.0

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.textfirstName.text = self.DTPersonProfile.firstName
        self.textlastName.text = self.DTPersonProfile.lastName

        if self.DTPersonProfile.image != nil {
            self.imageView.image = self.DTPersonProfile.image
        }
//        if self.DTPersonProfile.gitHubUserName != nil {
            self.gitHubUserName.text = self.DTPersonProfile.gitHubUserName
            }
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
    */
    
    override func viewWillDisappear (animated: Bool) {
        self.DTPersonProfile.firstName = self.textfirstName.text
        self.DTPersonProfile.lastName = self.textlastName.text
        if self.gitHubUserName.text != nil {
            self.DTPersonProfile.gitHubUserName = self.gitHubUserName.text

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
//MARK: Photo Button
    
    @IBAction func photoButtonPressed(sender: AnyObject) {
        
        var imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController (imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController (picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        println ("user picked an image")
        
        var editedImage = info[UIImagePickerControllerEditedImage] as UIImage
        self.imageView.image = editedImage
        self.DTPersonProfile.image = editedImage
    }
    
    func imagePickerControllerDidCancel (picker: UIImagePickerController!) {
        
    }
    
//coding from willrichman
    
//    @IBAction func getGitHubButton(sender: AnyObject) {
//        if self.personDisplayed?.gitHubUserName == nil {
//            var gitHubPrompt = UIAlertController(title: "GitHub", message: "What is this person's GitHub user name?", preferredStyle: UIAlertControllerStyle.Alert)
//            gitHubPrompt
    
    
    
    }


