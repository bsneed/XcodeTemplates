//
//  SwiftFeatureLibiOS.swift
//  SwiftFeatureLibiOS
//
//  Created by Sneed, Brandon on 9/19/17.
//  Copyright © 2017 __TemplateOrgName__. All rights reserved.
//

import Foundation

public func test() {
    print("hello")
}

internal func resourceBundle() -> Bundle? {
    var result: Bundle? = Bundle(identifier: "--templateorgname--.SwiftFeatureLibiOSResources")
    
    if result == nil {
        if let bundlePath = Bundle.main.path(forResource: "SwiftFeatureLibiOSResources", ofType: "bundle") {
            result = Bundle(path: bundlePath)
        }
    }

    return result
}
