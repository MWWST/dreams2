//
//  ViewController.swift
//  Dreams2
//
//  Created by Michael Weitzman on 1/18/16.
//  Copyright © 2016 World Source Tech. All rights reserved.
//

import UIKit

class DreamsViewController: UITableViewController, CancelButtonDelegate, DreamDetailsViewControllerDelegate {
    
    
    var dreams = [Dream]()
     var isEditing: Bool?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // dequeue the cell from our storyboard
        let cell = tableView.dequeueReusableCellWithIdentifier("DreamCell")!
        // if the cell has  a text lable, set it to the model that is corresponding to the row in the array
        cell.textLabel?.text = dreams[indexPath.row].story
        // return the cell so that Table View knows what to draw in each row
        return cell
    }
    
    
    // make as many cells as we have in the data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dreams.count
    }
    
    
    //conform to the cancel button delegate 
    
    func cancelButtonPressedFrom(controller: UIViewController) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // now when we segue to DreamsDetailsView Controller we are going to set ourselves as the cancelButtonDelegate
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddNewDream" {
            // so we check to see if our segue idenfier is "AddNewDream" and if it is we set a constant, "navigationController"
            // = to the destination view controller
           
            let navigationController = segue.destinationViewController as! UINavigationController
            //then we set another constant as "controller" as the topView controller as the
            //controller we actually want to go to
            let controller = navigationController.topViewController as! DreamDetailsViewController
            
             // finally we set the cancel button delegate to this view controller so that when the cancel button is pressed 
            // and the delegate function runs, it knows which controller to show?
            controller.cancelButtonDelegate = self
             controller.delegate = self
        } else if segue.identifier == "EditDream" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! DreamDetailsViewController
            controller.cancelButtonDelegate = self
            controller.delegate = self
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
                controller.dreamToEdit = dreams[indexPath.row]
            }
        }
    }
    
    func dreamDetailsViewController(controller: DreamDetailsViewController, didFinishAddingDream dream: String) {
        print(dream)
        dismissViewControllerAnimated(true, completion: nil)
        dreams.append(Dream(story:dream,id:dreams.count+1))
        tableView.reloadData()
    }
    
    func dreamDetailsViewController(controller: DreamDetailsViewController, didFinishEditingDream dream: Dream) {
        var exists = false
        for var i = 0; i < dreams.count; ++i {
            if dreams[i].id == dream.id {
               dreams[i] = dream
                exists = true
            }
        }
        if !exists {
            dreams.append(dream)
        }
        
        
        dismissViewControllerAnimated(true, completion: nil)
//        mission.save()
        
        
        tableView.reloadData()
    }
    
    func dreamDetailsViewcontroller(controller: DreamDetailsViewController, didFinishEditingDream dream: String) {
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        dreams[indexPath.row].destroy()
        dreams.removeAtIndex(indexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("EditDream", sender: tableView.cellForRowAtIndexPath(indexPath))
    }


}

