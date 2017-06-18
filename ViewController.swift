//
//  ViewController.swift
//  h
//
//  Created by mac on 15/7/16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

import UIKit
class P
{
    var a : Array<Int>
    var turn = 0
    init()
    {
        a = Array<Int>(count: 225, repeatedValue: 0)
        a[94] = 1
        a[95] = 2  //初始化棋子的位置
    }
    func zouqi(i:Int,j:Int)
    {
        if (i<0||i>14||j<0||j>14)
        { return }
        else  if a[i*15+j] != 0
        { return }
        else
        {
           a[i*15+j] = turn%2 == 0 ? 1 : 2
           turn++
        }
        
    }
    func is_over(i:Int,j:Int)->Int  //一共有四个轴，每个轴上有两个相反的方向，每两个方向判定一次count的值。
    {
        var count = 1
        for var k = i-1 ; k >= 0 ; k--  //向左走棋
        {   if a[i*15+j] == a[k*15+j]
            {count++}
            else
            {break}
        }
        for var k = i+1 ; k < 15 ; k++   //向右走棋
        {   if a[i*15+j] == a[k*15+j]
        {count++}
        else
        {break}
        }
        if(count>=5) {return a[i*15+j]} //判定棋子是否是连续的5个不是，则从1开始算
        else {count=1}
        for var k = j-1 ; k >= 0 ; k--  //向上走棋
        {   if a[i*15+j] == a[i*15+k]
        {count++}
        else
        {break}
        }
        for var k = j+1 ; k < 15 ; k++  //向下走棋
        {   if a[i*15+j] == a[i*15+k]
        {count++}
        else
        {break}
        }
        if(count>=5) {return a[i*15+j]}
        else {count=1}
        
        for var k = i-1 ; k >= 0 && i+j-k < 15 ; k--  //右上
        {   if a[i*15+j] == a[k*15+i+j-k]
        {count++}
        else
        {break}
        }
        for var k = i+1 ; k < 15 && i+j-k >= 0; k++ //左下
        {   if a[i*15+j] == a[k*15+i+j-k]
        {count++}
        else
        {break}
        }
        if(count>=5) {return a[i*15+j]}
        else {count=1}
        
        for var k = j-1 ; k >= 0 && k-i+j >= 0 ; k-- //左上斜线上相邻两个棋子的关系
        {   if a[i*15+j] == a[k*15+k-i+j]
        {count++}
        else
        {break}
        }
        for var k = j+1 ; k < 15 && k-i+j < 15; k++
        {   if a[i*15+j] == a[k*15+k-i+j]
        {count++}
        else
        {break}
        }
        if(count>=5) {return a[i*15+j]}
        else {return 0}
    }
    func show_P(con:CGContextRef,w:CGFloat,x:CGFloat,y:CGFloat)
    {
        for var i = 0 ; i < 15 ; i++
        {
            CGContextMoveToPoint(con, x+w/2+CGFloat(i)*w, y)
            CGContextAddLineToPoint(con, x+w/2+CGFloat(i)*w, y+15*w)
        }
        for var i = 0 ; i < 15 ; i++
        {
            CGContextMoveToPoint(con, x,y+w/2+CGFloat(i)*w)
            CGContextAddLineToPoint(con, x+15*w, y+w/2+CGFloat(i)*w)
        }
        CGContextStrokePath(con)
    }
    func show_z(con:CGContextRef,w:CGFloat,x:CGFloat,y:CGFloat,i:Int,j:Int)
    {
        if a[i*15+j] == 0
        {return}
        CGContextAddEllipseInRect(con,CGRectMake(x+CGFloat(j)*w,y+CGFloat(i)*w,w,w))
        if a[i*15+j] == 1
        {
            UIColor.blackColor().setFill()
            
        }
        else
            
            {
                UIColor.whiteColor().setFill()
                
        }
        CGContextFillPath(con)
        
        
    }
    
}
class ViewController: UIViewController {
    
    var myLabel = UILabel()
    var myButton = UIButton()
    var mv = myview()
    override func viewDidLoad() {
        super.viewDidLoad()
        mv.backgroundColor=UIColor.grayColor()
        self.view=mv
        myLabel.frame = CGRectMake(0, 427, 275, 30)
        myLabel.backgroundColor = UIColor.greenColor()
        myLabel.text = "Who is the winner?"
        myLabel.textColor = UIColor.blackColor()
        myButton.frame = CGRectMake(276, 427, 99, 30)
        myButton.backgroundColor = UIColor.greenColor()
        myButton.setTitle("Restart", forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        myButton.addTarget(self, action: "restart", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myLabel)
        self.view.addSubview(myButton)
//        func restart(but: UIButton)
//        {
//            self.view.
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

