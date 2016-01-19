//
//  DreamDetailsViewController.swift
//  Dreams2
//
//  Created by Michael Weitzman on 1/18/16.
//  Copyright © 2016 World Source Tech. All rights reserved.
//

import UIKit

class DreamDetailsViewController: UITableViewController {
    
    var dreamToEdit: Dream?
    
    @IBAction func cancelBarButtonPressed(sender: UIBarButtonItem) {
        // cancel button delegate function takes in a controller so it knows 
        // what is being cancelled. when this buttpon is pressed it goes to the delegate, the deleagte looks to see what controller conforms and then
        // implements the controllers function for the delegate.
        cancelButtonDelegate?.cancelButtonPressedFrom(self)
        
        // this function resides in the dreams view controller
        // and we are passing "self" to it as the controller to dismiss, but we 
        // are passing "self" from the details controller, so it knows to dismiss 
        // this modal view which leaves it self showing (not related to this self).
    }
    
    @IBAction func doneBarButtonPressed(sender: UIBarButtonItem) {
        
        if let dream = dreamToEdit {
            dream.story = newDreamTextField.text!
            delegate?.dreamDetailsViewController(self, didFinishEditingDream: dream)
            
        } else {
            
        
        print(newDreamTextField.text!)
        delegate?.dreamDetailsViewController(self, didFinishAddingDream: newDreamTextField.text!)
        }
    }
    
    @IBOutlet weak var newDreamTextField: UITextField!
    weak var delegate: DreamDetailsViewControllerDelegate?
    weak var cancelButtonDelegate: CancelButtonDelegate?
    
    // now we need to implement the delegate function for adding a new entry. 
    
    // when the done button is pressed we want to grab what is in the text label and send it to our delegate
    // then our delegate will append it to its array of strings (our delegate being the dreams view controller
    // so we first go and create this delegate 
    
    
    
    
}