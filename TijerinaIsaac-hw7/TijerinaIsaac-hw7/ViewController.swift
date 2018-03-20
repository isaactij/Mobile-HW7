//
//  ViewController.swift
//  TijerinaIsaac-hw7
//
//  Created by Isaac on 3/19/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var left:Bool = true
    var width:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let bounds = UIScreen.main.bounds
        width = Int(bounds.size.width)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rightSwipeGesture(_ sender: Any) {
        let newPosition:Int = width
        left = true
        UIView.animate(withDuration: 0.75, delay: 0, options: .curveLinear, animations: {
            self.label.frame.origin.x = CGFloat(newPosition)
        })
    }
    
    @IBAction func leftSwipeGesture(_ sender: Any) {
        let newPosition:Int = -98
        left = false
        UIView.animate(withDuration: 0.75, delay: 0, options: .curveLinear, animations: {
            self.label.frame.origin.x = CGFloat(newPosition)
        })
    }
    
    @IBAction func tapGesture(_ sender: Any) {
        let xPostition:Int = Int(label.frame.origin.x)
        if left {
            var newPosition = xPostition - 50
            if newPosition < 0 {
                newPosition = 0
                left = false
            }
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
                self.label.frame.origin.x = CGFloat(newPosition)
            })
        }else{
            var newPosition:Int = xPostition + 50
            if newPosition > width - 98 {
                newPosition = width - 98
                left = true
            }
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
                self.label.frame.origin.x = CGFloat(newPosition)
            })
        }
    }
}

