//
//  ShineLabel.swift
//  Summer
//
//  Created by DerekYuYi on 2018/8/31.
//  Copyright © 2018年 Summer. All rights reserved.
//

import UIKit

class ShineLabel: UILabel {
    
    /// Fade in text animation duration. Defaults to 2.5.
    internal var shineDuration: CFTimeInterval?
    
    internal var fadeoutDuration: CFTimeInterval?
    
    internal var autoStart: Bool = false
    
    internal var shining: Bool {
        if let displayLink = displayLink {
            return !displayLink.isPaused
        }
        return false
    }
    
    internal var visible: Bool {
        return !fadedOut
    }
    
    /// Private Properties
    private var attributedString: NSMutableAttributedString?
    private var characterAnimationDurations: [Double] = []
    private var characterAnimationDelays: [Double] = []
    private var displayLink: CADisplayLink?
    private var beginTime: CFTimeInterval?
    private var endTime: CFTimeInterval?
    private var fadedOut: Bool = false
    private var completion: (()->Void)?
    
    override var text: String? {
        didSet {
            if let text = text {
                attributedText = NSAttributedString(string: text)
            }
        }
    }
    
    override var attributedText: NSAttributedString? {
        didSet {
            if let attributedText = attributedText {
                attributedString = NSMutableAttributedString(attributedString: attributedText)
                if let attributedString = attributedString {
                    attributedString.addAttribute(.backgroundColor, value: textColor.withAlphaComponent(0), range: NSRange(location: 0, length: attributedString.length))
                    
                    guard let shineDuration = shineDuration else { return }
                    for _ in 0..<attributedText.length {
                        let element = Double(arc4random_uniform(UInt32((shineDuration / 2 * 100) / 100.0)))
                        characterAnimationDelays.append(element)
                        let remain = shineDuration - element
                        characterAnimationDurations.append(Double(arc4random_uniform(UInt32((remain * 100) / 100.0))))
                    }
                }
               
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup() {
        shineDuration = 2.5
        fadeoutDuration = 2.5
        autoStart = false
        fadedOut = true
        textColor = .white
        
        displayLink = CADisplayLink(target: self, selector: #selector(updateAttributedString))
        displayLink?.isPaused = true
        displayLink?.add(to: RunLoop.main, forMode: .commonModes)
    }
    
    @objc func updateAttributedString() {
        guard let attributedString = attributedString,
            let beginTime = beginTime, let endTime = endTime else { return }
        
        let now = CACurrentMediaTime()
        for index in 0..<attributedString.length {
            if CharacterSet.whitespacesAndNewlines.contains(attributedString.string[String.Index(encodedOffset: index)].unicodeScalars.first!) {
                continue
            }
            attributedString.enumerateAttribute(.foregroundColor, in: NSRange(location: index, length: 1), options: .longestEffectiveRangeNotRequired) { (value, range, stop) in
                guard let value = value as? UIColor else { return }
                let alpha = value.cgColor.alpha
                let shouldUpdate = (fadedOut && alpha > 0) || (!fadedOut && alpha < 1) || (now - beginTime) >= characterAnimationDelays[index]
                if !shouldUpdate { return }
                
                var percentage = (now - beginTime - characterAnimationDelays[index]) / characterAnimationDurations[index]
                if fadedOut {
                    percentage = 1 - percentage
                }
                attributedString.addAttribute(.foregroundColor, value: textColor.withAlphaComponent(CGFloat(percentage)), range: range)
            }
        }
        if now > endTime {
            displayLink?.isPaused = true
            if let completion = completion {
                completion()
            }
        }
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        if let _ = self.window, autoStart {
            shine()
        }
    }
    
    // MARK: - Start the animation
    func shine() {
        shineWithCompletion()
    }
    
    func shineWithCompletion(_ completion: (()->Void)? = nil) {
        if !shining && fadedOut {
            self.completion = completion
            fadedOut = false
            if let shineDuration = shineDuration {
                startAnimation(shineDuration)
            }
        }
    }
    
    func fadeOut() {
        fadeOutWithCompletion()
    }
    
    func fadeOutWithCompletion(_ completion: (()->Void)? = nil) {
        if !shining && !fadedOut {
            self.completion = completion
            fadedOut = true
            if let fadeoutDuration = fadeoutDuration {
                startAnimation(fadeoutDuration)
            }
        }
    }
    
    
    func startAnimation(_ duration: CFTimeInterval) {
        guard var beginTime = beginTime,
            var endtime = endTime,
            let shineDuration = shineDuration else { return }
        
        beginTime = CACurrentMediaTime()
        endtime = beginTime + shineDuration
        displayLink?.isPaused = false
    }

}
