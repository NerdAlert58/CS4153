//
//  Puzzle.swift
//  T01_Orange
//
//  Created by Scott Bushyhead on 9/18/16.
//  Copyright © 2016 Scott Bushyhead. All rights reserved.
//

import Foundation

class Puzzle {
    var p: [String] = []//= ["1","2","3","4","5","6","7","8",""]
    var sorted: [String] = []
    var pieces = Array<Array<String>>()
    var blankPosition = -1
    var gridSize = 0
    
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
    
    init(size: Int) {
        gridSize = size
        let tot = pow(Double(size),Double(2))
        print("Total: \(tot)")
        // midRows = size < THESE < (size^2-size)
        // midRows = count > size && count < ((size^2)-size)
        var count = 0
        let total = Int(tot)
        //for count in 0...(end){
        while count < total {
            print("\(count)")
            if ((count >= gridSize) && (count < (total - gridSize)) && (count % gridSize == 0)){ //LeftEdge logic
                p.append(String(count+1))
                pieces.append(leftEdge)
                print("left edge")
            }else if ((count > gridSize) && (count < (total - gridSize)) && (count % gridSize == (gridSize - 1))){ //RightEdge logic
                p.append(String(count+1))
                pieces.append(rightEdge)
                print("right edge")
            }else if ((count > 0) && (count < (gridSize - 1))){ //topEdge logic
                p.append(String(count+1))
                pieces.append(topEdge)
                print("top edge")
            }else if (count > (total - gridSize) && count < (total - 1)){ //botEdge logic
                p.append(String(count+1))
                pieces.append(botEdge)
                print("bot edge")
            }else if(count == 0){ //topleft logic
                p.append(String(count+1))
                pieces.append(topLeft)
                print("top left")
            }else if(count == (gridSize - 1)){ //topRight logic
                p.append(String(count+1))
                pieces.append(topRight)
                print("top right")
            }else if(count == (total - gridSize)){ //botLeft logic
                p.append(String(count+1))
                pieces.append(botLeft)
                print("bot left")
            }else if(count == (total - 1)){ //botRight logic
                p.append("")
                pieces.append(botRight)
                print("bot right")
            }else {
                p.append(String(count+1))
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
    
    func scramble(input: [String]) -> [String]{
        let output: [String] = input
        return output
    }
    
    func switchTiles(blank: Int,val: Int){
        p[blank] = p[val]
        p[val] = ""
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
    
    func toString(number: Int) -> String {
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
            }
            break
        case "DOWN":
            if(pieces[blankPosition].contains("down")){
                //Need to code the changes to the array blank moves opposite of gesture -> up
                print("Down")
                //switch the blankposition with the value in above it
                switchTiles(blank: blankPosition,val: (blankPosition - gridSize))
            }
            break
        case "LEFT":
            if(pieces[blankPosition].contains("left")){
                //Need to code the changes to the array blank moves opposite of gesture -> right
                print("Left")
                //switch the blankposition with the value in below it
                switchTiles(blank: blankPosition,val: (blankPosition + 1))
            }
            break
        case "RIGHT":
            if(pieces[blankPosition].contains("right")){
                //Need to code the changes to the array blank moves opposite of gesture -> left
                print("Right")
                //switch the blankposition with the value in below it
                switchTiles(blank: blankPosition,val: (blankPosition - 1))
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
