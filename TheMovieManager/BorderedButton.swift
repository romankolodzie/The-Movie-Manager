//
//  BorderedButton.swift
//  MyFavoriteMovies
//
//  Created by Jarrod Parkes on 1/23/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import UIKit

class BorderedButton: UIButton {
    
    var backingColor: UIColor? = nil
    var transparent = UIColor.clearColor()
    var Orange: UIColor? = TMDBClient.UI.orange
    
    // MARK: Initialization
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        themeBorderedButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        themeBorderedButton()
    }
    
    private func themeBorderedButton() {
        layer.masksToBounds = true
        layer.cornerRadius = 0.0
        layer.borderWidth = 1.0
        layer.borderColor = TMDBClient.UI.orange.CGColor
        setTitleColor(Orange, forState: .Normal)
        setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        
        var buttonFrame: CGRect = layer.frame;
        buttonFrame.size = CGSizeMake(150, 50);
        layer.frame = buttonFrame;
    }
    
    // MARK: Setters
    
    
    private func setHighlightedBackingColor(newHighlightedBackingColor: UIColor) {
        Orange = newHighlightedBackingColor
        backingColor = Orange
    }
    
    // MARK: Tracking
    
    override func beginTrackingWithTouch(touch: UITouch, withEvent: UIEvent?) -> Bool {
        backgroundColor = Orange
        return true
    }
    
    override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        backgroundColor = backingColor
    }
    
    override func cancelTrackingWithEvent(event: UIEvent?) {
        backgroundColor = backingColor
    }
    
    // MARK: Layout
    
    override func sizeThatFits(size: CGSize) -> CGSize {
        let extraButtonPadding : CGFloat = 100.0
        var sizeThatFits = CGSizeZero
        sizeThatFits.width = super.sizeThatFits(size).width + extraButtonPadding
        sizeThatFits.height = 44.0
        return sizeThatFits
    }
    
}