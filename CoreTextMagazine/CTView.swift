//
//  CTView.swift
//  CoreTextMagazine
//
//  Created by Aryan Sharma on 27/12/19.
//  Copyright © 2019 Aryan Sharma. All rights reserved.
//

import UIKit
import CoreText

class CTView: UIView {

    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        // Flip the coordinate system
        context.textMatrix = .identity
        context.translateBy(x: 0, y: bounds.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        
        let path = CGMutablePath()
        path.addRect(bounds)
        
        let attrString = NSAttributedString(string: "Hello World")
        
        let frameSetter = CTFramesetterCreateWithAttributedString(attrString as CFAttributedString)
        
        let frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, attrString.length), path, nil)
        
        CTFrameDraw(frame, context)
    }
    

}
