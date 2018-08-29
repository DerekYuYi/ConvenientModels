//
//  AnimatedLabel.swift
//  Summer
//
//  Created by DerekYuYi on 2018/8/29.
//  Copyright © 2018年 Summer. All rights reserved.
//

import UIKit

public enum DWAnimationType {
    case none, typewriter, shine, fade, wave
}

class AnimatedLabel: UILabel {
    
    // MARK: - Public Properties
    var animationType = DWAnimationType.none {
        didSet {
            
        }
    }
    
    // MARK: - Private Properties
    private var placeHolderView: UIView?
    private var _duration: TimeInterval = 4.0
//    private var _hollowLabel:
//    private var _animator:
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    

}
