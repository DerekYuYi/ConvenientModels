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
        self.view.backgroundColor = UIColor.white
        self.title = "CADisplayLink 动画特效"
        // Do any additional setup after loading the view.
        
        // 1. typewriter
//        let label = AnimatedLabel(frame: CGRect(x: 20, y: 100, width: 300, height: 50))
//        label.text = "This is a typewriter effection."
//        label.sizeToFit()
//        label.animationType = .typewriter
//        label.backgroundColor = UIColor.red
//        label.textColor = .yellow
//        view.addSubview(label)
//        label.startAnimation(duration: 3.0, nextText: label.text, completion: nil)
//
//        // 2. shine
//        let labelShine = AnimatedLabel(frame: CGRect(x: 20, y: 190, width: 400, height: 50))
//        labelShine.text = "Hey, I have something to say..."
//        labelShine.sizeToFit()
//        labelShine.animationType = .shine
//        labelShine.backgroundColor = UIColor.red
//        labelShine.textColor = .yellow
//        view.addSubview(labelShine)
//        labelShine.startAnimation(duration: 7.0, nextText: label.text, completion: nil)
//
//        // 3. fade
//        let labelFade = AnimatedLabel(frame: CGRect(x: 20, y: 270, width: 500, height: 70))
//        labelFade.text = "fade label fade label animation effection."
//        labelFade.sizeToFit()
//        labelFade.animationType = .fade
//        labelFade.backgroundColor = UIColor.red
//        labelFade.textColor = .yellow
//        view.addSubview(labelFade)
//        labelFade.startAnimation(duration: 6.0, nextText: labelFade.text, completion: nil)
        
        // 4. wave
        let labelWave = AnimatedLabel(frame: CGRect(x: 20, y: 330, width: 500, height: 300))
        labelWave.text = "wave label animation effection."
        labelWave.sizeToFit()
        labelWave.animationType = .wave
        labelWave.backgroundColor = UIColor.black
        labelWave.placeHolderColor = .gray
        labelWave.textColor = .white
        view.addSubview(labelWave)
        labelWave.startAnimation(duration: 8.0, nextText: labelWave.text, completion: nil)
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
