//
//  XHorizontalMenuView.swift
//  XHorizontalView
//
//  Created by X on 16/5/16.
//  Copyright © 2016年 XHorizontalView. All rights reserved.
//

import UIKit

extension UIColor
{
    func getRGB() -> (r:CGFloat,g:CGFloat,b:CGFloat)
    {
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        
        var resultingPixel:[CUnsignedChar] = [0,0,0,0]
        
        let context = CGBitmapContextCreate(&resultingPixel,
                                            1,
                                            1,
                                            8,
                                            4,
                                            rgbColorSpace,
                                            CGImageAlphaInfo.NoneSkipLast.rawValue)
        
        CGContextSetFillColorWithColor(context, self.CGColor)
        CGContextFillRect(context, CGRectMake(0, 0, 1, 1))
        
        return (CGFloat(resultingPixel[0]),CGFloat(resultingPixel[1]),CGFloat(resultingPixel[2]))
        
    }
}

class XHorizontalMenuModel: NSObject {
    
    var title:String=""
    var id:Int=0
    var view:UIView?
    
    deinit
    {
        print("XHorizontalMenuModel deinit !!!!!!!!!!")
    }
}


class XHorizontalMenuView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource {

    let line:UIView = UIView()
    
    var menuTextColor : UIColor = UIColor(red: 86.0/255.0, green: 86.0/255.0, blue: 86.0/255.0, alpha: 1.0)
        {
        didSet
        {
            reloadData()
        }
    }
    
    var menuSelectColor:UIColor = UIColor(red: 223.0/255.0, green: 48.0/255.0, blue: 49.0/255.0, alpha: 1.0)
        {
        didSet
        {
            reloadData()
        }
    }
    
    var menuBGColor : UIColor = UIColor(red: 246.0/255.0, green: 244.0/255.0, blue: 243.0/255.0, alpha: 1.0)
        {
        didSet
        {
            backgroundColor = menuBGColor
            reloadData()
        }
    }
    
    var menuMaxScale : CGFloat = 1.3
        {
        didSet
        {
            if menuMaxScale < 1.0 {menuMaxScale = 1.0}
            reloadData()
        }
        
    }
    
    var menuWidth:CGFloat
    {
        return frame.size.width/self.menuPageNum
    }
    
    var selectIndex : Int = 0
        {
        didSet
        {
            reloadData()
            
            selectItemAtIndexPath(NSIndexPath(forRow: self.selectIndex, inSection: 0), animated: true, scrollPosition: UICollectionViewScrollPosition.CenteredHorizontally)
            
            UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                
                self.line.center.x = self.menuWidth*CGFloat(self.selectIndex)+self.menuWidth/2.0
                
                self.main?.contentOffset=CGPointMake(self.main!.frame.size.width*CGFloat(self.selectIndex), 0);
                
                }, completion: { (finish) -> Void in
                    
            })
            
        }
    }
    
    weak var main:XHorizontalMainView?
    
    var menuPageNum:CGFloat = 3
    
    var menuArr:[XHorizontalMenuModel] = []
    {
        didSet
        {
            self.changeUI()
        }
        
    }
    
    var UIChanged:Bool = false
    {
        willSet
        {
            if newValue != UIChanged
            {
                changeUI()
            }
            
        }

    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setValue(true, forKey: "UIChanged")
        
    }
    
    func changeUI()
    {

        let size = (self.collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize
        
        if size?.width != menuWidth || size?.height != frame.size.height
        {
            print("UI is Change!!!!!!!!!")
            
            (self.collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize = CGSizeMake(menuWidth, frame.size.height)
            reloadData()
            
            
            line.frame.size.width = self.menuWidth*0.8
            self.line.frame.origin.y = self.frame.size.height - 3.0
            self.line.center.x = self.menuWidth*CGFloat(self.selectIndex)+self.menuWidth/2.0
        }
 
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
        super.init(frame: frame, collectionViewLayout: layout)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(XHorizontalMenuView.changeUI), name: UIDeviceOrientationDidChangeNotification, object: nil)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        backgroundColor = menuBGColor
        
        registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "headMenuCell")
        
        delegate = self
        dataSource = self

        line.backgroundColor=menuSelectColor
        line.frame=CGRectMake(0, frame.size.height-3, self.menuWidth*0.8, 3);
        line.center.x = frame.size.width/menuPageNum/2.0
        addSubview(line)
        
    }
    
    convenience init(frame: CGRect,arr:[XHorizontalMenuModel]) {
        
        
        let menulayout = UICollectionViewFlowLayout()
        menulayout.scrollDirection = .Horizontal
        menulayout.minimumLineSpacing = 0.0
        menulayout.minimumInteritemSpacing = 0.0
        menulayout.itemSize = CGSizeMake(frame.size.width, frame.size.height)
        
        self.init(frame: frame, collectionViewLayout: menulayout)

        menuArr = arr
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return menuArr.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let obj = menuArr[indexPath.row]
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("headMenuCell", forIndexPath: indexPath)
        
        for item in cell.contentView.subviews
        {
            item.removeFromSuperview()
        }
        
        let titleLabel = UILabel()
        titleLabel.frame = cell.bounds
        titleLabel.text=obj.title
        titleLabel.textAlignment=NSTextAlignment.Center;
        titleLabel.backgroundColor=UIColor.clearColor()
        titleLabel.textColor = menuTextColor
        titleLabel.font=UIFont.systemFontOfSize(18.0)
        titleLabel.tag = 30+indexPath.row
        
        titleLabel.sizeToFit()
        titleLabel.center = CGPointMake(cell.frame.size.width / 2.0, cell.frame.size.height / 2.0)
        
        if(indexPath.row==self.selectIndex)
        {
            titleLabel.textColor=menuSelectColor
            
            titleLabel.transform = CGAffineTransformMakeScale(menuMaxScale, menuMaxScale)
        }
        else
        {
            titleLabel.transform = CGAffineTransformMakeScale(1.0, 1.0)
        }
        
        cell.contentView.addSubview(titleLabel)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.selectIndex=indexPath.row;
        
    }
    
    deinit
    {
        print("XHorizontalMenuView deinit !!!!!!!!!!")
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
}
