//
//  DisplayLinkViewController.swift
//  Summer
//
//  Created by DerekYuYi on 2018/8/29.
//  Copyright © 2018年 Summer. All rights reserved.
//

import UIKit

class DisplayLinkViewController: UIViewController {
    
    var displayLink: CADisplayLink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        self.title = "CADisplayLink 动画特效"
        // Do any additional setup after loading the view.
        
        // setup displayLink
        displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink?.isPaused = true
        displayLink?.add(to: RunLoop.main, forMode: .commonModes)
    }
    
    @objc func update() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
