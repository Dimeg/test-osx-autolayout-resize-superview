//
//  ViewController.swift
//  Test
//
//  Created by Developer on 13/07/15.
//  Copyright (c) 2015 Vadim Sitel. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    let containerView = NSView()
    let leftView = NSView()
    let rightView = NSView()
    let button = NSButton()

    var rightViewHeightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        leftView.backgroundColor = NSColor.redColor()
        rightView.backgroundColor = NSColor.orangeColor()
        layout()
        button.title = "Make Right Bigger"
        button.target = self
        button.action = "makeBigger:"
        ViewControllerLayout.layoutBotton(view, insertView: button, bottom: -20)
    }

    func makeBigger(sender: AnyObject) {
        rightViewHeightConstraint?.animator().constant = 150
    }

    func layout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        view.addConstraint(NSLayoutConstraint(item: containerView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: containerView, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: containerView, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: containerView, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1, constant: -100))

        leftView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(leftView)
        containerView.addConstraint(NSLayoutConstraint(item: leftView, attribute: .Top, relatedBy: .Equal, toItem: containerView, attribute: .Top, multiplier: 1, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: leftView, attribute: .Left, relatedBy: .Equal, toItem: containerView, attribute: .Left, multiplier: 1, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: leftView, attribute: .Width, relatedBy: .Equal, toItem: containerView, attribute: .Width, multiplier: 0.5, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: leftView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100))

        rightView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(rightView)
        containerView.addConstraint(NSLayoutConstraint(item: rightView, attribute: .Top, relatedBy: .Equal, toItem: containerView, attribute: .Top, multiplier: 1, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: rightView, attribute: .Right, relatedBy: .Equal, toItem: containerView, attribute: .Right, multiplier: 1, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: rightView, attribute: .Width, relatedBy: .Equal, toItem: containerView, attribute: .Width, multiplier: 0.5, constant: 0))
        rightViewHeightConstraint = NSLayoutConstraint(item: rightView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 50)
        containerView.addConstraint(rightViewHeightConstraint!)

        view.addConstraint(NSLayoutConstraint(item: containerView, attribute: .Height, relatedBy: .GreaterThanOrEqual, toItem: leftView, attribute: .Height, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: containerView, attribute: .Height, relatedBy: .GreaterThanOrEqual, toItem: rightView, attribute: .Height, multiplier: 1, constant: 0))
    }
}

struct ViewControllerLayout {

    static func layoutBotton(containerView: NSView, insertView: NSView, bottom: Double) {
        insertView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(insertView)
        containerView.addConstraint(NSLayoutConstraint(item: insertView, attribute: .CenterX, relatedBy: .Equal, toItem: containerView, attribute: .CenterX, multiplier: 1, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: insertView, attribute: .Bottom, relatedBy: .Equal, toItem: containerView, attribute: .Bottom, multiplier: 1, constant: CGFloat(bottom)))
    }
}


