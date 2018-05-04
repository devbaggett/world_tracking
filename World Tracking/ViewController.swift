//
//  ViewController.swift
//  World Tracking
//
//  Created by Devin Baggett on 5/3/18.
//  Copyright © 2018 devbaggett. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        // adding debug options shows if world origin is properly detected, and if feature points are constantly being discovered. World origin is starting position in real world.
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        // track position and orientation at all times
        self.sceneView.session.run(configuration)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

