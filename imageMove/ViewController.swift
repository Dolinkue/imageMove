//
//  ViewController.swift
//  imageMove
//
//  Created by Nicolas Dolinkue on 22/01/2023.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowRadius = 3.0
        imageView.layer.shadowOpacity = 1.0
        imageView.layer.shadowOffset = CGSize(width: 4, height: 4)
        imageView.layer.masksToBounds = false
        
      if motionManager.isAccelerometerAvailable {
          
          motionManager.accelerometerUpdateInterval = 0.5
          
          motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
              guard let data = data else { return }
              
              let x = CGFloat(data.acceleration.x)
              let y = CGFloat(data.acceleration.y)
              let z = CGFloat(data.acceleration.z)
              
              DispatchQueue.main.async {
                  UIView.animate(withDuration: 0.5) {
                      self.imageView.center = CGPoint(x: self.view.center.x + x * 50, y: self.view.center.y + y * 50)
                  }
              }
              
          }
      }
   }
}

