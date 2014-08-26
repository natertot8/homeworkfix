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
    
    
    @IBOutlet weak var imageView: UIImageView!
   
    
    @IBOutlet weak var textfirstName: UITextField!
    
    
    @IBOutlet weak var textlastName: UITextField!
    
    
    
    
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
        

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    }
    override func viewWillDisappear (animated: Bool) {
        self.DTPersonProfile.firstName = self.textfirstName.text
        self.DTPersonProfile.lastName = self.textlastName.text
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
        println (self.DTPersonProfile.firstName)
        self.DTPersonProfile.image = editedImage
    }
    
    func imagePickerControllerDidCancel (picker: UIImagePickerController!) {
        
    }
    
    

    
}
