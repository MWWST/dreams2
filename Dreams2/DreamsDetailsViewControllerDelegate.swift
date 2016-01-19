//
//  AddButtonDelegate.swift
//  Dreams2
//
//  Created by Michael Weitzman on 1/18/16.
//  Copyright © 2016 World Source Tech. All rights reserved.
//

import Foundation

protocol DreamDetailsViewControllerDelegate: class {
    
    // just adding our "didfinishAddingDream" delegate function
    func dreamDetailsViewController(controller: DreamDetailsViewController, didFinishAddingDream dream: String)
    func dreamDetailsViewController(controller: DreamDetailsViewController, didFinishEditingDream dream: Dream)
    
}
