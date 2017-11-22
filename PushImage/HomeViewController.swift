//
//  ViewController.swift
//  PushImage
//
//  Created by 施宏政 on 2017/11/22.
//  Copyright © 2017年 施宏政. All rights reserved.
//

import Cocoa

class HomeViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var staticLabel: NSTextField!
    @IBOutlet weak var loadingSpinner: NSProgressIndicator!
    @IBOutlet weak var dragView: DragView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

