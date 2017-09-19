//
//  ViewController.swift
//  TestHarness
//
//  Created by Sneed, Brandon on 9/19/17.
//  Copyright © 2017 __TemplateOrgName__. All rights reserved.
//

import UIKit
@testable import SwiftFeatureLibiOS

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        test()
                
        let resourceBundle = SwiftFeatureLibiOS.resourceBundle()
        imageView.image = UIImage(named: "heck_yeah", in: resourceBundle, compatibleWith: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

