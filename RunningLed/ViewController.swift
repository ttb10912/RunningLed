//
//  ViewController.swift
//  RunningLed
//
//  Created by TTB10912 on 05/09/2016.
//  Copyright © 2016 TTB10912. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var a = 5
    var _margin:CGFloat = 50
    var lastOnLed = -1
    var chayLed:Bool = false
    


    override func viewDidLoad() {
        super.viewDidLoad()
        drawBall()
        
        //timer
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self , selector: #selector(runningLed), userInfo: nil, repeats: true)
        
    }
    
    func runningLed()  {
        
        if (chayLed == false) {
            // chay tien len
            
            if ( lastOnLed != -1)
            { turnOffLed()
            }
            
            if ( lastOnLed != a - 1)
            { lastOnLed = lastOnLed + 1
            }
                
            else
            {
                chayLed = true
            }
            
            turnOnLed()


        }
        
        
        if(chayLed == true) {
            
            
            if (lastOnLed == a - 1) {
                turnOffLed()
            }
            
            // chay lui lai
            if (lastOnLed != a - 1 )
            {
                turnOffLed()
            }
            
            if (lastOnLed != -1 )
            {
                lastOnLed = lastOnLed - 1
            }
                
            else
            {
                chayLed = false
            }
            turnOnLed()

            
        }
      

       
        
    }

    func turnOnLed()  {
        if let ball = self.view.viewWithTag(100 + lastOnLed)as? UIImageView
        {
            ball.image = UIImage(named: "green")
            
        }
        
    }
    
    func turnOffLed()  {
        if let ball = self.view.viewWithTag(100 + lastOnLed)as? UIImageView
        {
            
            ball.image = UIImage(named: "gray")
            
        }
    }
    
    
    func drawBall()  {
        for indexHang in 0..<a {
            for indexCot in 0..<a{
                let image = UIImage(named: "green")
                let ball = UIImageView(image : image)
                
                ball.center = CGPointMake(_margin + CGFloat(indexHang) * spaceBetweenBalls(), CGFloat(indexCot) * spaceBetweenHBalls()+_margin)
                
                //dat tag cho ball
                ball.tag = indexHang + 100
                
                self.view.addSubview(ball)
                
                
            }
            
        }
        
    }
    func spaceBetweenBalls() -> CGFloat {
        let space = (self.view.bounds.size.width - 2*_margin)/CGFloat(a-1)
        
        return space
    }
    func spaceBetweenHBalls() -> CGFloat {
        let spaceH = (self.view.bounds.size.height - 2*_margin)/CGFloat(a-1)
        
        return spaceH
    }

  

}

