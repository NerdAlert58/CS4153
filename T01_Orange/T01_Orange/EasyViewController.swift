//
//  EasyViewController.swift
//  T01_Orange
//
//  Created by Scott Bushyhead on 9/13/16.
//  Copyright © 2016 Scott Bushyhead. All rights reserved.
//

import UIKit

class EasyViewController: UIViewController {

    var puz = Puzzle(size: 4)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let slideRight = UISwipeGestureRecognizer(target: self, action:#selector(EasyViewController.slideBlock(gesture:)))
        slideRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(slideRight)
        let slideLeft = UISwipeGestureRecognizer(target: self, action:#selector(EasyViewController.slideBlock(gesture:)))
        slideLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(slideLeft)
        let slideUp = UISwipeGestureRecognizer(target: self, action:#selector(EasyViewController.slideBlock(gesture:)))
        slideUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(slideUp)
        let slideDown = UISwipeGestureRecognizer(target: self, action:#selector(EasyViewController.slideBlock(gesture:)))
        slideDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(slideDown)
        print("Added all gestures")
        
        //puz.Puzzle(size: 3)
        
        display()
    }
    
    func display() {
        let winw = self.view.frame.size.width
        let numlines = puz.gridSize - 1
        let wline = 10 / numlines
        let wtile = ((Int(winw) - (wline * puz.gridSize))) / puz.gridSize
        let htile = wtile
        print("winw is \(winw)")
        print("tile is \(wtile) X \(htile)")
        print("wline is \(wline)")
    }
    
    func slideBlock(gesture: UIGestureRecognizer)
    {
        print("Gesture Detected")
        if let slideGesture = gesture as? UISwipeGestureRecognizer {
            print("Gesture is a slide")
            switch slideGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
                puz.modArray(g: "RIGHT")
                display(numb: 2)
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
                puz.modArray(g: "DOWN")
                display(numb: 2)
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                puz.modArray(g: "LEFT")
                display(numb: 2)
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
                puz.modArray(g: "UP")
                display(numb: 2)
            default:
                print("other")
                break
            }
        }
    }
    
    func display(numb: Int){
        switch numb {
        case 1:
            print("[\(puz.toString(number: 0))][\(puz.toString(number: 1))][\(puz.toString(number: 2))]")
            print("[\(puz.toString(number: 3))][\(puz.toString(number: 4))][\(puz.toString(number: 5))]")
            print("[\(puz.toString(number: 6))][\(puz.toString(number: 7))][\(puz.toString(number: 8))]")
            break
        case 2:
            print("[\(puz.toString(number: 0))][\(puz.toString(number: 1))][\(puz.toString(number: 2))][\(puz.toString(number: 3))]")
            print("[\(puz.toString(number: 4))][\(puz.toString(number: 5))][\(puz.toString(number: 6))][\(puz.toString(number: 7))]")
            print("[\(puz.toString(number: 8))][\(puz.toString(number: 9))][\(puz.toString(number: 10))][\(puz.toString(number: 11))]")
            print("[\(puz.toString(number: 12))][\(puz.toString(number: 13))][\(puz.toString(number: 14))][\(puz.toString(number: 15))]")
            break
        default:
            puz.printPuzzle()
            break
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
