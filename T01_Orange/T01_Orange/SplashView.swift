//
//  SplashView.swift
//  T01_Orange
//
//  Created by Scott Bushyhead on 9/18/16.
//  Copyright © 2016 Scott Bushyhead. All rights reserved.
//

import UIKit

class SplashView: UIView {

    let title = UIImage(named: "Splash2.png")
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        guard let title = title else{
            return
        }
        
        let r = CGRect(x:10,y:35,
                       width: title.size.width / 2.25,
                       height: title.size.height / 2.25)
        title.draw(in: r)
    }
    

}
