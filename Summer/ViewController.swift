//
//  ViewController.swift
//  Summer
//
//  Created by yuyi on 2017/9/21.
//  Copyright © 2017年 Summer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {

    @IBOutlet weak var clockLabel: UILabel!
    var count: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.clockLabel.layer.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        leftAnimation()
//        rightAnimation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func leftAnimation() {
        let leftAnim = animation("transform.rotation.z", toValue: NSNumber(value: Float.pi/8.0))
        leftAnim.setValue("left", forKey: "left")
        clockLabel.layer.add(leftAnim, forKey: "left")
    }
    
    func rightAnimation() {
        let rightAnim = animation("transform.rotation.z", toValue: NSNumber(value: -Float.pi/8.0))
        rightAnim.setValue("right", forKey: "right")
        clockLabel.layer.add(rightAnim, forKey: "right")
    }
    
    func animation(_ keyPath: String, toValue value: NSNumber) -> CABasicAnimation {
        let baseAnim = CABasicAnimation(keyPath: keyPath)
        baseAnim.duration = 4
        baseAnim.fromValue = NSNumber(value: 0)
        baseAnim.toValue = value
        baseAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        baseAnim.autoreverses = true
        baseAnim.repeatCount = 10
//        baseAnim.delegate = self
        baseAnim.fillMode = kCAFillModeForwards
        
        return baseAnim
    }
    
    
    func animationDidStart(_ anim: CAAnimation) {}
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            if let key = anim.value(forKey: "left") as? String, key == "left" {
                rightAnimation()
            } else if let key = anim.value(forKey: "right") as? String, key == "right" {
                count += 1
                if count <= 2 {
                    leftAnimation()
                } else {
                    clockLabel.layer.removeAllAnimations()
                }
            }
        }
    }
    

}

