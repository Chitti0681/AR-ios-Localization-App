//
//  ViewController.swift
//  ARWalkthrough
//
//  Created by Wyszynski, Daniel on 2/16/18.
//  Copyright © 2018 Nike, Inc. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class FirstViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var sceneController = HoverScene()
    var rootConnector:RootController!
    var didInitializeScene: Bool = false
    var messageRoot = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        rootConnector = RootController()
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        if let scene = sceneController.scene {
            // Set the scene to the view
            sceneView.scene = scene
        }
    
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTapScreen))
//        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

//    @objc func didTapScreen(recognizer: UITapGestureRecognizer) {
//        if didInitializeScene {
//            if let camera = sceneView.session.currentFrame?.camera {
//                var translation = matrix_identity_float4x4
//                translation.columns.3.z = -1.0
//                let transform = camera.transform * translation
//                let position = SCNVector3(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)
//                sceneController.addSphere(position: position)
//            }
//        }
//    }
    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
//    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
//        if !didInitializeScene {
//            if sceneView.session.currentFrame?.camera != nil {
//                didInitializeScene = true
//            }
//       }
//    }
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
      if !didInitializeScene {
        if let camera = sceneView.session.currentFrame?.camera {
          didInitializeScene = true
          var translation = matrix_identity_float4x4
          let listItems = messageRoot.components(separatedBy: ",")
//          print(listItems[0])
//          print(listItems[1])
//          print(listItems[2])
//          print(listItems[3])
//          print(listItems[4])
//          print(listItems[5])
          let x_value1 = Float(listItems[0]) ?? 0.0
          let y_value1 = Float(listItems[1]) ?? 0.0
          let z_value1 = Float(listItems[2]) ?? 0.0
            
          let x_value2 = Float(listItems[3]) ?? 0.0
          let y_value2 = Float(listItems[4]) ?? 0.0
          let z_value2 = Float(listItems[5]) ?? 0.0
            
            let x_value3 = Float(listItems[6]) ?? 0.0
            let y_value3 = Float(listItems[7]) ?? 0.0
            let z_value3 = Float(listItems[8]) ?? 0.0
            
            let x_value4 = Float(listItems[9]) ?? 0.0
            let y_value4 = Float(listItems[10]) ?? 0.0
            let z_value4 = Float(listItems[11]) ?? 0.0
          print("Float values")
          print(x_value1)
          print(y_value1)
          print(z_value1)
          print(x_value2)
          print(y_value2)
          print(z_value2)
            print(x_value3)
            print(y_value3)
            print(z_value3)
            print(x_value4)
            print(y_value4)
            print(z_value4)
          translation.columns.3.z = -z_value1
          translation.columns.3.x = x_value1
          translation.columns.3.y = y_value1
          let transform1 = camera.transform * translation
          let position1 = SCNVector3(transform1.columns.3.x, transform1.columns.3.y, transform1.columns.3.z)
          translation.columns.3.z = -z_value2
          translation.columns.3.x = x_value2
          translation.columns.3.y = y_value2
          let transform2 = camera.transform * translation
          let position2 = SCNVector3(transform2.columns.3.x, transform2.columns.3.y, transform2.columns.3.z)
            translation.columns.3.z = -z_value3
            translation.columns.3.x = x_value3
            translation.columns.3.y = y_value3
            let transform3 = camera.transform * translation
            let position3 = SCNVector3(transform3.columns.3.x, transform3.columns.3.y, transform3.columns.3.z)
            translation.columns.3.z = -z_value4
            translation.columns.3.x = x_value4
            translation.columns.3.y = y_value4
            let transform4 = camera.transform * translation
            let position4 = SCNVector3(transform4.columns.3.x, transform4.columns.3.y, transform4.columns.3.z)
//          sceneController.addSphere(position: position2)
          sceneController.addSphere(position: position1)
//            sceneController.addSphere(position: position3)
//            sceneController.addSphere(position: position4)
        }
      }
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
