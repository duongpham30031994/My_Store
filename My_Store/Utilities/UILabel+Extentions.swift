//
//  UILabel+Extentions.swift
//  My_Store
//
//  Created by Apple on 5/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    func strikedAttributedString(fraction: Double = 1) -> NSAttributedString {
        let range = NSRange(0..<Int(fraction * Double(length)))
        return strike(with: .styleThick, range: range)
    }
    
    var unstrikedAttributedString: NSAttributedString {
        return strike(with: .styleNone)
    }
    
    private func strike(with style: NSUnderlineStyle, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        let attributeName = NSAttributedStringKey.strikethroughStyle
        let fullRange = NSRange(0..<length)
        mutableAttributedString.removeAttribute(attributeName, range: fullRange)
        mutableAttributedString.addAttribute(attributeName, value: style.rawValue, range: range ?? fullRange)
        
        return mutableAttributedString
    }
    
}

@IBDesignable class CustomLabel: UILabel {
    @IBInspectable var isStrike: Bool = true {
        didSet {
            attributedText = isStrike ?
                attributedText?.strikedAttributedString(fraction: 1) : attributedText?.unstrikedAttributedString
        }
    }
}
