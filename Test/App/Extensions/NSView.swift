//
// Created by Developer on 07/07/15.
// Copyright (c) 2015 Vadim Sitel. All rights reserved.
//

import Cocoa

extension NSView {

    var backgroundColor: NSColor? {
        get {
            if let layer = layer {
                return NSColor(CGColor: layer.backgroundColor)
            } else {
                return nil
            }
        }

        set(newBackgroundColor) {
            if let newBackgroundColor = newBackgroundColor {
                if let layer = layer {
                    layer.backgroundColor = newBackgroundColor.CGColor
                } else {
                    let newLayer = CALayer()
                    newLayer.backgroundColor = newBackgroundColor.CGColor
                    layer = newLayer
                }

                if wantsLayer == false {
                    wantsLayer = true
                }
            } else {
                if let layer = layer {
                    layer.backgroundColor = nil
                }
            }
        }
    }
}
