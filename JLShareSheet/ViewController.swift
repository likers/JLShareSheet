//
//  ViewController.swift
//  JLShareSheet
//
//  Created by Jinhuan Li on 1/18/16.
//  Copyright © 2016 likers33. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mShareButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mShareButton.addTarget(self, action: "shareTapped", forControlEvents: .TouchUpInside)
//        let view = JLShareSheet(frame: CGRect(x: 16, y: 100, width: 100, height: 100))
//        self.view.addSubview(view)
        
        
    }
    
    func shareTapped() {
        print("yes")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

