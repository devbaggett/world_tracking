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
        self.sceneView.autoenablesDefaultLighting = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func add(_ sender: Any) {
//        let cylinder = SCNNode(geometry: SCNCylinder(radius: 0.1, height: 0.15))
//        cylinder.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        cylinder.position = SCNVector3(0,0,-0.3)
//        cylinder.eulerAngles = SCNVector3(0,0,Float(90.degreesToRadians))
//        self.sceneView.scene.rootNode.addChildNode(cylinder)
//
//        let pyramid = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
//        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.red
//        pyramid.position = SCNVector3(0,0,-0.5)
//        cylinder.addChildNode(pyramid)
        
        
//        node.geometry = SCNCapsule(capRadius: 0.1, height: 0.3)
//        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
//        node.geometry = SCNCone(topRadius: 0.1, bottomRadius: 0.1, height: 0.3)
//        node.geometry = SCNSphere(radius: 0.1)
//        node.geometry = SCNCylinder(radius: 0.2, height: 0.2)
//        node.geometry = SCNTube(innerRadius: 0.2, outerRadius: 0.3, height: 0.5)
//        node.geometry = SCNTorus(ringRadius: 0.3, pipeRadius: 0.1)
//        node.geometry = SCNPlane(width: 0.2, height: 0.2)
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 0, y: 0))
//        path.addLine(to: CGPoint(x: 0, y: 0.2))
//        path.addLine(to: CGPoint(x: 0.2, y: 0.3))
//        path.addLine(to: CGPoint(x: 0.4, y: 0.2))
//        path.addLine(to: CGPoint(x: 0.4, y: 0))
//        let shape = SCNShape(path: path, extrusionDepth: 0.2)
//        node.geometry = shape
        
        let doorNode = SCNNode(geometry: SCNPlane(width: 0.03, height: 0.06))
        doorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        let boxNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        let node = SCNNode()
        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        node.position = SCNVector3(0.2,0.3,-0.2) // (x,y,z)
        node.eulerAngles = SCNVector3(Float(180.degreesToRadians),0,0)
        boxNode.position = SCNVector3(0, -0.05, 0)
        doorNode.position = SCNVector3(0, -0.02, 0.053)
        self.sceneView.scene.rootNode.addChildNode(node)
        node.addChildNode(boxNode)
        boxNode.addChildNode(doorNode)
//        let x = randomNumbers(firstNum: -0.1, secondNum: 0.1)
//        let y = randomNumbers(firstNum: -0.1, secondNum: 0.1)
//        let z = randomNumbers(firstNum: -0.1, secondNum: 0.1)

       
//        self.sceneView.scene.rootNode.addChildNode(cylinderNode)
    }
    
    @IBAction func reset(_ sender: Any) {
        self.restartSession()
    }
    
    func restartSession(){
        self.sceneView.session.pause()
        // remove box from sceneview
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180}
}

