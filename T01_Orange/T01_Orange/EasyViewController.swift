//
//  EasyViewController.swift
//  T01_Orange
//
//  Created by Scott Bushyhead on 9/13/16.
//  Copyright © 2016 Scott Bushyhead. All rights reserved.
//

import UIKit
import GameplayKit


class EasyViewController: UIViewController {

    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet weak var finishedLabel: UILabel!
    var randomImage: [String] = ["pp1.jpeg"]
    var finished = false
    
    
    var puz = Puzzle(size: 3)
    var imageArray: [String] = ["pp1.jpeg","pp2.jpeg","pp3.jpeg","pp4.jpeg","pp5.jpeg","pp6.jpeg","pp7.jpeg","pp8.jpeg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        display()
        puz.shuffle()
        display()
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
        //randomImage = GKRandomSource().arrayByShufflingObjects(in: imageArray as [String])
        display(numb: 1)
    }
    
    
    
    func display() {
        //Window width
        let winw = self.view.frame.size.width
        //number of lines between tiles in puzzle
        let numlines = puz.gridSize - 1
        //line in between each tile width
        let wline = 10 / numlines
        //width and height of tiles
        let wtile = ((Int(winw) - (wline * puz.gridSize))) / puz.gridSize
        let htile = wtile
        print("winw is \(winw)")
        print("tile is \(wtile) X \(htile)")
        print("wline is \(wline)")
        
        let imageback = "gray.png"
        let image = UIImage(named: imageback)
        var xVar = 3
        var yVar = 100
        var it = 0
        
        for _ in 0..<puz.gridSize {
            for _ in 0..<puz.gridSize {
                if (puz.p[it] == -1) {
                    let myEmptyTile = UIImageView(image: image)
                    myEmptyTile.frame = CGRect(x: xVar, y: yVar, width: wtile, height:htile)
                    self.view.addSubview(myEmptyTile)
                }else {
                    let thisImage = UIImage(named: "pp\(puz.p[it]).jpeg")
                    let myTileImage = UIImageView(image: thisImage)
                    myTileImage.frame = CGRect(x: xVar, y: yVar, width: wtile, height:htile)
                    self.view.addSubview(myTileImage)
                }
                it += 1
                xVar = xVar+wtile+wline
            }
                yVar = yVar+htile+wline
                xVar = 3
            }
        if(finished){
            xVar = 3
            xVar = xVar + (puz.gridSize - 1)*(wtile+wline)
            yVar = 100
            yVar = yVar + (puz.gridSize - 1)*(htile+wline)
            let thisImage = UIImage(named: "pp\(puz.total).jpeg")
            let myTileImage = UIImageView(image: thisImage)
            myTileImage.frame = CGRect(x: xVar, y: yVar, width: wtile, height:htile)
            self.view.addSubview(myTileImage)
        }
        
        print("sorted index array ")
    }
    
    func switchTiles(blank: Int,val: Int){
        //swap(randomImage[blank], randomImage[val])
        randomImage[blank] = randomImage[val]
        randomImage[val] = "gray.png"
        //blankPosition = val
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
                display(numb: 1)
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
                puz.modArray(g: "DOWN")
                display(numb: 1)
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                puz.modArray(g: "LEFT")
                display(numb: 1)
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
                puz.modArray(g: "UP")
                display(numb: 1)
            default:
                print("other")
                break
            }
            if(puz.blankPosition == (puz.total - 1)){
                if(puz.isFinished()){
                    //Yea!
                    //puz.blankPosition = puz.total + 1
                    finished = true
                    print("The new blank position is: \(puz.blankPosition)")
                    finishedLabel.isHidden = false
                    display()
                }
            }
            movesLabel.text = "Moves: \(puz.moves)"
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
        display()
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
