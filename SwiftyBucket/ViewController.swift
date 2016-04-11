//
//  ViewController.swift
//  SwiftyBucket
//
//  Created by Tamir Duberstein on 4/11/16.
//  Copyright © 2016 Tamir Duberstein. All rights reserved.
//

import UIKit

func setLabelTextToUInt32(value: UInt32, context: UnsafePointer<Void>) {
    UnsafePointer<UILabel>(context).memory.text = String(value)
}

class ViewController: UIViewController {
    let cButton: UIButton
    var cLabel: UILabel
    let rustButton: UIButton
    var rustLabel: UILabel

    init?(_ coder: NSCoder? = nil) {
        let cUIx: CGFloat = 40

        cButton = UIButton(type: UIButtonType.RoundedRect)
        cButton.frame = CGRectMake(cUIx, 200, 100, 30)
        cButton.addTarget(nil, action: #selector(cButtonPressed), forControlEvents: UIControlEvents.TouchUpInside)
        cButton.setTitle("C Me!", forState: UIControlState.Normal)

        cLabel = UILabel(frame: CGRectMake(cUIx, 150, 200, 30))
        cLabel.text = "Hello World!"

        let rustUIx: CGFloat = 160;

        rustButton = UIButton(type: UIButtonType.RoundedRect)
        rustButton.frame = CGRectMake(rustUIx, 200, 100, 30)
        rustButton.addTarget(nil, action: #selector(rustButtonPressed), forControlEvents: UIControlEvents.TouchUpInside)
        rustButton.setTitle("Rust Me!", forState: UIControlState.Normal)

        rustLabel = UILabel(frame: CGRectMake(rustUIx, 150, 200, 30))
        rustLabel.text = "Hello World!"

        if let coder = coder {
            super.init(coder: coder)
        } else {
            super.init(nibName: nil, bundle: nil)
        }
    }

    required convenience init?(coder: NSCoder) {
        self.init(coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(self.cButton)
        view.addSubview(self.cLabel)
        view.addSubview(self.rustButton)
        view.addSubview(self.rustLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func cButtonPressed() {
        withUnsafePointer(&self.cLabel, { (label) in callSetterWithRandom(setLabelTextToUInt32, label) })
    }

    func rustButtonPressed() {
        withUnsafePointer(&self.rustLabel, { (label) in call_setter_with_random(setLabelTextToUInt32, label) })
    }
}

