//
//  ViewController.swift
//  SwiftyBucket
//
//  Created by Tamir Duberstein on 4/11/16.
//  Copyright © 2016 Tamir Duberstein. All rights reserved.
//

import UIKit

func setLabelTextToUInt32(value: UInt32, context: UnsafeRawPointer?) {
    context!.assumingMemoryBound(to: UILabel.self).pointee.text = String(value)
}

class ViewController: UIViewController {
    let cButton: UIButton
    var cLabel: UILabel
    let rustButton: UIButton
    var rustLabel: UILabel

    init?(_ coder: NSCoder? = nil) {
        let cUIx: CGFloat = 40

        cButton = UIButton(type: UIButtonType.roundedRect)
        cButton.frame = CGRect(x: cUIx, y: 200, width: 100, height: 30)
        cButton.addTarget(nil, action: #selector(cButtonPressed), for: UIControlEvents.touchUpInside)
        cButton.setTitle("C Me!", for: UIControlState())

        cLabel = UILabel(frame: CGRect(x: cUIx, y: 150, width: 200, height: 30))
        cLabel.text = "Hello World!"

        let rustUIx: CGFloat = 160;

        rustButton = UIButton(type: UIButtonType.roundedRect)
        rustButton.frame = CGRect(x: rustUIx, y: 200, width: 100, height: 30)
        rustButton.addTarget(nil, action: #selector(rustButtonPressed), for: UIControlEvents.touchUpInside)
        rustButton.setTitle("Rust Me!", for: UIControlState())

        rustLabel = UILabel(frame: CGRect(x: rustUIx, y: 150, width: 200, height: 30))
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

    @objc func cButtonPressed() {
        withUnsafePointer(to: &self.cLabel, { (label) in callSetterWithRandom(setLabelTextToUInt32, label) })
    }

    @objc func rustButtonPressed() {
        withUnsafePointer(to: &self.rustLabel, { (label) in call_setter_with_random(setLabelTextToUInt32, label) })
    }
}

