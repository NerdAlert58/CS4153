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
    var pieces = Array<Array<String>>()
    var blankPosition = 8
    
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
    
    
    func Puzzle(size: Int){
        let total = size^2;
        // midRows = size < THESE < (size^2-size)
        // midRows = count > size && count < ((size^2)-size)
        
        for count in 0...(total - 1){
            if ((count > size) && (count < ((size^2)-size)) && (count % size == 0)){ //LeftEdge logic
                p.append(String(count+1))
                pieces.append(leftEdge)
                break
            }else if ((count > size) && (count < ((size^2)-size)) && (count % size == (size-1))){ //RightEdge logic
                p.append(String(count+1))
                pieces.append(rightEdge)
                break
            }else if ((count > 0) && (count < (size-1))){ //topEdge logic
                p.append(String(count+1))
                pieces.append(topEdge)
                break
            }else if (count > (total - size) && count < (total - 1)){ //botEdge logic
                p.append(String(count+1))
                pieces.append(botEdge)
                break
            }else if(count == 0){ //topleft logic
                p.append(String(count+1))
                pieces.append(topLeft)
                break
            }else if(count == (size-1)){ //topRight logic
                p.append(String(count+1))
                pieces.append(topRight)
                break
            }else if(count == (total - size)){ //botLeft logic
                p.append(String(count+1))
                pieces.append(botLeft)
                break
            }else if(count == (total - 1)){ //botRight logic
                p.append("")
                pieces.append(botRight)
                break
            }else {
                p.append(String(count+1))
                pieces.append(mid)
                break
            }
        }
        print("Values in p are:")
        for value in p{
            print(value)
        }
        print("Values in pieces are:")
        for value in pieces{
            print(value)
        }
    }
    
    func scramble(input: [String]) -> [String]{
        let output: [String] = input
        return output
    }
    
    //This function will actually accept the gesture recognizer, but I haven't looked at that piece yet.
    func modArray(g: String) {
        switch g {
        case "UP":
            if(pieces[blankPosition].contains("up")){
                //Need to code the changes to the array blank moves opposite of gesture -> down
                print("Up")
            }
            break
        case "DOWN":
            if(pieces[blankPosition].contains("down")){
                //Need to code the changes to the array blank moves opposite of gesture -> up
                print("Down")
            }
            break
        case "LEFT":
            if(pieces[blankPosition].contains("left")){
                //Need to code the changes to the array blank moves opposite of gesture -> right
                print("Left")
            }
            break
        case "Right":
            if(pieces[blankPosition].contains("right")){
                //Need to code the changes to the array blank moves opposite of gesture -> left
                print("Right")
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
