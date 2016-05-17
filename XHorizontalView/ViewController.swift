//
//  ViewController.swift
//  XHorizontalView
//
//  Created by X on 16/5/13.
//  Copyright © 2016年 XHorizontalView. All rights reserved.
//

import UIKit

var sw:CGFloat
{
    return UIScreen.mainScreen().bounds.size.width
}

var sh:CGFloat
{
    return UIScreen.mainScreen().bounds.size.height
}


class PassModel {
    
    var menuTextColor:UIColor = UIColor.clearColor()
    var menuSelectColor:UIColor = UIColor.clearColor()
    var menuBGColor:UIColor = UIColor.clearColor()
    var menuMaxScale : CGFloat = 1
    var menuPageNum:CGFloat = 1
    
}

var styleModel = PassModel()


class ViewController: UIViewController{

    
    @IBOutlet var view1: UIView!
    
    @IBOutlet var view2: UIView!
    
    @IBOutlet var view3: UIView!
    
    @IBOutlet var scaleSlider: UISlider!
   
    @IBOutlet var menuPageNumSlider: UISlider!
    
    
    @IBOutlet var scaleLabel: UILabel!
    
    @IBOutlet var pageNumLabel: UILabel!
    
    
    @IBAction func scaleChange(sender: UISlider) {
        
        scaleLabel.text = "\(sender.value)"
        
        styleModel.menuMaxScale = CGFloat(sender.value)
    }
    
    
    @IBAction func pageNumChange(sender: UISlider) {
        
        pageNumLabel.text = "\(Int(sender.value))"
        
        styleModel.menuPageNum = CGFloat(Int(sender.value))
    }
    
    
    weak var button1:UIButton?
    weak var button2:UIButton?
    weak var button3:UIButton?
    
    @IBAction func setTextColor(sender: UIButton) {
        
        sender.selected = !sender.selected
        
        button1?.selected = !button1!.selected
        
        button1=sender
        
        if sender.selected
        {
            styleModel.menuTextColor = sender.backgroundColor!
        }
    }
    
    @IBAction func setSelectColor(sender: UIButton) {
        
        sender.selected = !sender.selected
        
        button2?.selected = !button2!.selected
        
        button2=sender
        
        if sender.selected
        {
            styleModel.menuSelectColor = sender.backgroundColor!
        }
    }
    
    @IBAction func setBGColor(sender: UIButton) {
        
        sender.selected = !sender.selected
        
        button3?.selected = !button3!.selected
        
        button3=sender
        
        if sender.selected
        {
            styleModel.menuBGColor = sender.backgroundColor!
        }
    }
    
    
    
    
    @IBAction func doJump(sender: AnyObject) {
        
        
        let vc = VC1()
        if #available(iOS 8.0, *) {
            self.showViewController(vc, sender: nil)
        } else {
            // Fallback on earlier versions
        }

        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        for item in view1.subviews
        {
            if let b = item as? UIButton
            {
                if b.selected
                {
                    button1 = b
                    styleModel.menuTextColor = b.backgroundColor!
                    break
                }
            }
        }
        
        for item in view2.subviews
        {
            if let b = item as? UIButton
            {
                if b.selected
                {
                    button2 = b
                    styleModel.menuSelectColor = b.backgroundColor!
                    break
                }
            }
        }

        
        for item in view3.subviews
        {
            if let b = item as? UIButton
            {
                if b.selected
                {
                    button3 = b
                    styleModel.menuBGColor = b.backgroundColor!
                    break
                }
            }
        }

        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

