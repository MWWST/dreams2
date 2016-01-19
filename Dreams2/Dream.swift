//
//  Dream.swift
//  Dreams2
//
//  Created by Michael Weitzman on 1/18/16.
//  Copyright © 2016 World Source Tech. All rights reserved.
//


import Foundation



class Dream {
    var id: Int
    var story: String
    init(story: String, id: Int) {
        self.id = id
        self.story = story
    }
    
    static func all() ->[Dream] {
        var missions = [Dream]()
        return missions
    }
        
}
    
    