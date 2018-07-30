//
//  Person.swift
//  project 10
//
//  Created by Babak Nikkhoo on 11/10/17.
//  Copyright © 2017 Babak Nikkhoo. All rights reserved.
//

import UIKit

class Person: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
