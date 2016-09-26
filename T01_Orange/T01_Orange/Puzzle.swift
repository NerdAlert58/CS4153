//
//  Puzzle.swift
//  T01_Orange
//
//  Created by Scott Bushyhead on 9/18/16.
//  Copyright © 2016 Scott Bushyhead. All rights reserved.
//

import Foundation
import GameplayKit

extension Array {
    mutating func scramble() {
/*        if count < 2 { return }
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            if (i != j) {
                swap(&self[i], &self[j])
            }
        }*/
        
        
    }
}

class Puzzle {
    var p: [Int] = []// ["1","2","3","4","5","6","7","8",""]
    var sorted: [Int] = []
    var pieces = Array<Array<String>>()
    var blankPosition = -1
    var gridSize = 0
    var total = 0
    var moves = 0

//    var randomImage: [UIImageView] = []
//    var isImagePuzzle: Bool = true
//    var imageArray = [#imageLiteral(resourceName: "pp1.jpeg"),#imageLiteral(resourceName: "pp2.jpeg"),#imageLiteral(resourceName: "pp3.jpeg"),#imageLiteral(resourceName: "pp4.jpeg"),#imageLiteral(resourceName: "pp5.jpeg"),#imageLiteral(resourceName: "pp6.jpeg"),#imageLiteral(resourceName: "pp7.jpeg"),#imageLiteral(resourceName: "pp8.jpeg"),#imageLiteral(resourceName: "gray.png")]
    
    //Corners
    var topLeft = ["up","left"]
    var topRight = ["up","right"]
    var botLeft = ["down","left"]
    var botRight = ["down","right"]
    
    //Edges
    var topEdge = ["up","left","right"]
    var botEdge = ["down","left","right"]
    var leftEdge = ["up","left","down"]
    var rightEdge = ["up","right","down"]
    
    //Middles
    var mid = ["up","down","right","left"]
    
    
    // topLeft = 0
    // topRight = size - 1
    // leftEdge = size, 2*size, ... , (size -1)*size
    // rightEdge = 2*size - 1, 2*size - 1 + size,
    // botLeft = size^2 - size
    // botEdge = size^2 - size < x < size^2 - 1
    // botRight = size^2 - 1
    
    func printPuzzle(){
        for item in p {
            print("[\(item)]")
        }
    }
    
    func shuffle(){
        var up = 0
        var down = 0
        var left = 0
        var right = 0
        
        for _ in 0...1000{
            let randir = Int(arc4random_uniform(4) + 1)
            switch (randir){
            case 1:
                modArray(g: "UP")
                up += 1
                break
            case 2:
                modArray(g: "DOWN")
                down += 1
                break
            case 3:
                modArray(g: "LEFT")
                left += 1
                break
            case 4:
                modArray(g: "RIGHT")
                right += 1
                break
            default:
                print("Shuffle method reached default.  SHOULDN'T be possible!")
                break
            }
        }
        for i in 0..<total {
            if p[i] == -1 {
                blankPosition = i
            }
        }
        moves = 0
        print("Random values counted = \(up),\(down),\(left),\(right)")
    }
    
    init(size: Int) {
        gridSize = size
        let tot = pow(Double(size),Double(2))
        print("Total: \(tot)")
        // midRows = size < THESE < (size^2-size)
        // midRows = count > size && count < ((size^2)-size)
        var count = 0
        total = Int(tot)
        //for count in 0...(end){
        while count < total {
            print("\(count)")
            if ((count >= gridSize) && (count < (total - gridSize)) && (count % gridSize == 0)){ //LeftEdge logic
                p.append(count+1)
                pieces.append(leftEdge)
                print("left edge")
            }else if ((count > gridSize) && (count < (total - gridSize)) && (count % gridSize == (gridSize - 1))){ //RightEdge logic
                p.append(count+1)
                pieces.append(rightEdge)
                print("right edge")
            }else if ((count > 0) && (count < (gridSize - 1))){ //topEdge logic
                p.append(count+1)
                pieces.append(topEdge)
                print("top edge")
            }else if (count > (total - gridSize) && count < (total - 1)){ //botEdge logic
                p.append(count+1)
                pieces.append(botEdge)
                print("bot edge")
            }else if(count == 0){ //topleft logic
                p.append(count+1)
                pieces.append(topLeft)
                print("top left")
            }else if(count == (gridSize - 1)){ //topRight logic
                p.append(count+1)
                pieces.append(topRight)
                print("top right")
            }else if(count == (total - gridSize)){ //botLeft logic
                p.append(count+1)
                pieces.append(botLeft)
                print("bot left")
            }else if(count == (total - 1)){ //botRight logic
                p.append(-1)
                pieces.append(botRight)
                print("bot right")
            }else {
                p.append(count+1)
                pieces.append(mid)
                print("mid")
            }
            count += 1
        }
        blankPosition = (total - 1)
        print("Values in p are:")
        for value in p{
            print(value)
        }
        print("Values in pieces are:")
        for value in pieces{
            print(value)
        }
        sorted = p
    }
    
    func switchTiles(blank: Int,val: Int){
        p[blank] = p[val]
        p[val] = -1
        blankPosition = val
    }
    
    func isFinished() -> Bool {
        // Check each item in the Array and verify order
        if p == sorted {
            return true
        }else {
            return false
        }
    }
    
    func toString(number: Int) -> Int {
        return p[number]
    }
    
    //This function will actually accept the gesture recognizer, but I haven't looked at that piece yet.
    func modArray(g: String) {
        switch g {
        case "UP":
            if(pieces[blankPosition].contains("up")){
                //Need to code the changes to the array blank moves opposite of gesture -> down
                print("Up")
                //switch the blankposition with the value in below it
                switchTiles(blank: blankPosition,val: (blankPosition + gridSize))
                moves += 1
            }
            break
        case "DOWN":
            if(pieces[blankPosition].contains("down")){
                //Need to code the changes to the array blank moves opposite of gesture -> up
                print("Down")
                //switch the blankposition with the value in above it
                switchTiles(blank: blankPosition,val: (blankPosition - gridSize))
                moves += 1
            }
            break
        case "LEFT":
            if(pieces[blankPosition].contains("left")){
                //Need to code the changes to the array blank moves opposite of gesture -> right
                print("Left")
                //switch the blankposition with the value in below it
                switchTiles(blank: blankPosition,val: (blankPosition + 1))
                moves += 1
            }
            break
        case "RIGHT":
            if(pieces[blankPosition].contains("right")){
                //Need to code the changes to the array blank moves opposite of gesture -> left
                print("Right")
                //switch the blankposition with the value in below it
                switchTiles(blank: blankPosition,val: (blankPosition - 1))
                moves += 1
            }
            break
        default:
            print("Do Nothing")
            break
        }
    }
    
    func rules(loc: Int, dir: String){
        //Corners - 0,2,6,8
        //Edges - 1,3,5,7
        //Middle - 4
        //Decisions: T/F -> False returns same array.
        
        

    }
    
    
    
}
