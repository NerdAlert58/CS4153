//
//  EasyViewController.swift
//  T01_Orange
//
//  Created by Scott Bushyhead on 9/13/16.
//  Copyright © 2016 Scott Bushyhead. All rights reserved.
//

import UIKit

class EasyViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let slideRight = UISwipeGestureRecognizer(target: self, action: Selector(("slideBlock:")))
        slideRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(slideRight)
        let slideLeft = UISwipeGestureRecognizer(target: self, action: Selector(("slideBlock:")))
        slideLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(slideLeft)
        let slideUp = UISwipeGestureRecognizer(target: self, action: Selector(("slideBlock:")))
        slideRight.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(slideUp)
        let slideDown = UISwipeGestureRecognizer(target: self, action: Selector(("slideBlock:")))
        slideRight.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(slideDown)
        
    }
    
    func slideBlock(gesture: UIGestureRecognizer) {
        
        if let slideGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch slideGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
