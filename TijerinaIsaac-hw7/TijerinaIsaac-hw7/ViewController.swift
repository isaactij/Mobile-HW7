//
//  ViewController.swift
//  TijerinaIsaac-hw7
//
//  Created by Isaac on 3/19/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    //Connection to label
    @IBOutlet weak var label: UILabel!
    //Determins the direction for the label to move
    var left:Bool = true
    //car to hold the width of the screen
    var width:Int = 0

    //First thing to run
    override func viewDidLoad() {
        super.viewDidLoad()
        let bounds = UIScreen.main.bounds
        width = Int(bounds.size.width)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Runs when user swipes right
    @IBAction func rightSwipeGesture(_ sender: Any) {
        //New position is edge
        let newPosition:Int = width
        left = true
        //Animates the movement of the label to the new position
        UIView.animate(withDuration: 0.75, delay: 0, options: .curveLinear, animations: {
            self.label.frame.origin.x = CGFloat(newPosition)
        })
    }
    
    //Runs when user swipes left
    @IBAction func leftSwipeGesture(_ sender: Any) {
        //New position is left edge
        let newPosition:Int = -98
        left = false
        //Animates the movement of the label to the nfew position
        UIView.animate(withDuration: 0.75, delay: 0, options: .curveLinear, animations: {
            self.label.frame.origin.x = CGFloat(newPosition)
        })
    }
    
    //Runes when user taps
    @IBAction func tapGesture(_ sender: Any) {
        //Finds the current position
        let xPostition:Int = Int(label.frame.origin.x)
        if left {
            //Calculates new position
            var newPosition = xPostition - 50
            //Chesk to see if new position is ouside the screeen and if so changes it
            if newPosition < 0 {
                newPosition = 0
                left = false
            } else if newPosition > width - 98 {
                newPosition = width - 98
                left = false
            }
            //Animates movement
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
                self.label.frame.origin.x = CGFloat(newPosition)
            })
        }else{
            //Calculates new position
            var newPosition:Int = xPostition + 50
            //Chesk to see if new position is ouside the screeen and if so changes it
            if newPosition > width - 98 {
                newPosition = width - 98
                left = true
            } else if newPosition - 98 < 0 {
                newPosition = 0
                left = true
            }
            //Animates movement
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
                self.label.frame.origin.x = CGFloat(newPosition)
            })
        }
    }
}

