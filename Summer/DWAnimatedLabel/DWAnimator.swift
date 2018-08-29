//
//  DWAnimator.swift
//  Summer
//
//  Created by DerekYuYi on 2018/8/29.
//  Copyright © 2018年 Summer. All rights reserved.
//

import UIKit

class DWAnimator: NSObject {
    // MARK: - Public Properties
    var duration: TimeInterval = 2.0
    weak var label: AnimatedLabel? {
        didSet {
            guard let text = label?.text else { return }
            setupAnimatedText(from: text)
        }
    }
    
    // MARK: - Private Properties
    private var animationType: DWAnimationType
    private var _shapeLayer: CAShapeLayer?
    private var _zoom: Double?
    private var _translate: Double?
    private var _waveHeight: Double?
    private var _reverse = false
    private var _displayLink: CADisplayLink?
    private var _beginTime: CFTimeInterval?
    private var _endTime: CFTimeInterval?
    private var _attributedString: NSMutableAttributedString?
    private var _characterAnimationDuration: [TimeInterval]?
    private var _characterAnimationDelay: [TimeInterval]?
    private var _completion: (() -> Void)?
    private var _isAnimating: Bool = false
    
    
    // MARK: - Init
    override init() {
        animationType = .none
        super.init()
    }
    
    convenience init(animationType: DWAnimationType, duration: TimeInterval) {
        self.init()
        self.animationType = animationType
        self.duration = duration
    }
    
    // MARK: - Public methods
    func startAnimation(_ completion:(() -> Void)?) {
        guard let label = self.label else { return }
        setup()
        label.layer.removeAllAnimations()
        
        if !_isAnimating {
            _completion = completion
            _beginTime = CACurrentMediaTime()
            _endTime = duration + _beginTime!
        }
    }
    
}

// MARK: - Private methods
extension DWAnimator {
    private func setup() {
        
    }
    
    private func setupAnimatedText(from labelText: String?) {
        
    }
}
