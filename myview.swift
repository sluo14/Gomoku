//
//  myview.swift
//  h
//
//  Created by mac on 15/7/16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

import UIKit

class myview: UIView {
       

    var p=P()
    var flag=true
    var w:CGFloat
    {
        return UIScreen.mainScreen().bounds.width/15
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
       
        
        if flag==false
        {return}
        var tou: AnyObject? = (touches as NSSet).anyObject()
        var cur = tou?.locationInView(self)
        var i = 0
        var j = 0
        i = Int((cur!.y - 50)/w)
        j = Int((cur!.x - 0)/w)
        p.zouqi(i, j: j)
        self.setNeedsDisplayInRect(CGRectMake(CGFloat(j)*w,CGFloat(i)*w+50,w,w))
        var an = p.is_over(i, j: j)
        var str=""
        if an == 1
        {
            str="黑胜了"
        }
        else if an == 2
        {
            str="白胜了"
        }
        else
        {return}
        println(str)
        flag = false
        

    }
    override func drawRect(rect: CGRect) {
        var con = UIGraphicsGetCurrentContext()
        p.show_P(con, w: w, x: 0, y: 50)
        for var i=0;i<225;i++
        {
        p.show_z(con, w: w, x: 0, y: 50, i: i/15, j: i%15)
        }
    }
  
}
