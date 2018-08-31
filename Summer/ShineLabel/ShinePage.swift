//
//  ShinePage.swift
//  Summer
//
//  Created by DerekYuYi on 2018/8/31.
//  Copyright © 2018年 Summer. All rights reserved.
//

import UIKit

class ShinePage: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    private let textArray = ["For something this complicated, it’s really hard to design products by focus groups. A lot of times, people don’t know what they want until you show it to them.",
                             "We’re just enthusiastic about what we do.",
                             "We made the buttons on the screen look so good you’ll want to lick them."]
    private var textIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstImageView.image = UIImage(named: "wallpaper1")
        secondImageView.image = UIImage(named: "wallpaper2")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
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
