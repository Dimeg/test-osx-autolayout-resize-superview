//
//  ViewController.swift
//  Test
//
//  Created by Developer on 13/07/15.
//  Copyright (c) 2015 Vadim Sitel. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    let leftView = NSView()
    let rightView = NSView()
    let button = NSButton()

    var rightViewHeightConstraint: NSLayoutConstraint?

    override func loadView() {
        self.view = TestView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        leftView.backgroundColor = NSColor.redColor()
        rightView.backgroundColor = NSColor.orangeColor()

        layoutLeft(view, insertView: leftView)
        layoutRight(view, insertView: rightView)

        button.title = "Make Right Bigger"
        button.target = self
        button.action = "makeBigger:"
        ViewControllerLayout.layoutBotton(view, insertView: button, bottom: -20)
    }

    func makeBigger(sender: AnyObject) {
        rightViewHeightConstraint?.animator().constant = 150.0
    }

    func layoutLeft(containerView: NSView, insertView: NSView) {
        insertView.translatesAutoresizingMaskIntoConstraints = false

        containerView.addSubview(insertView)

        let c1 = NSLayoutConstraint(item: insertView, attribute: .Left, relatedBy: .Equal, toItem: containerView, attribute: .Left, multiplier: 1.0, constant: 0.0)
        let c2 = NSLayoutConstraint(item: insertView, attribute: .Width, relatedBy: .Equal, toItem: containerView, attribute: .Width, multiplier: 0.5, constant: 0.0)
        let c3 = NSLayoutConstraint(item: insertView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100.0)
        let c4 = NSLayoutConstraint(item: insertView, attribute: .Top, relatedBy: .Equal, toItem: containerView, attribute: .Top, multiplier: 1.0, constant: 0.0)
        let c5 = NSLayoutConstraint(item: insertView, attribute: .Bottom, relatedBy: .Equal, toItem: containerView, attribute: .Bottom, multiplier: 1.0, constant: -100.0)

        containerView.addConstraint(c1)
        containerView.addConstraint(c2)
        containerView.addConstraint(c3)
        containerView.addConstraint(c4)
        containerView.addConstraint(c5)
    }

    func layoutRight(containerView: NSView, insertView: NSView) {
        insertView.translatesAutoresizingMaskIntoConstraints = false

        containerView.addSubview(insertView)

        let c1 = NSLayoutConstraint(item: insertView, attribute: .Right, relatedBy: .Equal, toItem: containerView, attribute: .Right, multiplier: 1.0, constant: 0.0)
        let c2 = NSLayoutConstraint(item: insertView, attribute: .Width, relatedBy: .Equal, toItem: containerView, attribute: .Width, multiplier: 0.5, constant: 0.0)
        let c3 = NSLayoutConstraint(item: insertView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50.0)
        let c4 = NSLayoutConstraint(item: insertView, attribute: .Top, relatedBy: .Equal, toItem: containerView, attribute: .Top, multiplier: 1.0, constant: 0.0)
        let c5 = NSLayoutConstraint(item: insertView, attribute: .Bottom, relatedBy: .Equal, toItem: containerView, attribute: .Bottom, multiplier: 1.0, constant: -100.0)

        containerView.addConstraint(c1)
        containerView.addConstraint(c2)
        containerView.addConstraint(c3)
        containerView.addConstraint(c4)
        // containerView.addConstraint(c5)

        rightViewHeightConstraint = c3
    }
}

struct ViewControllerLayout {

    static func layoutBotton(containerView: NSView, insertView: NSView, bottom: Double) {
        insertView.translatesAutoresizingMaskIntoConstraints = false

        containerView.addSubview(insertView)

        containerView.addConstraint(NSLayoutConstraint(item: insertView, attribute: .CenterX, relatedBy: .Equal, toItem: containerView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        containerView.addConstraint(NSLayoutConstraint(item: insertView, attribute: .Bottom, relatedBy: .Equal, toItem: containerView, attribute: .Bottom, multiplier: 1.0, constant: CGFloat(bottom)))
    }
}


