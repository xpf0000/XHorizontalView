//
//  VC1.swift
//  XHorizontalView
//
//  Created by X on 16/5/13.
//  Copyright © 2016年 XHorizontalView. All rights reserved.
//

import UIKit

class VC1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.navigationItem.hidesBackButton = true
        
        let view1 = UIView()
        
        view1.backgroundColor = UIColor.darkGrayColor()
        
        let view2 = UIView()
        
        view2.backgroundColor = UIColor.blueColor()
        
        let model = XHorizontalMenuModel()
        
        model.title = "A"
        
        model.view = view1
        
        let model1 = XHorizontalMenuModel()
        
        model1.title = "B"
        
        model1.view = view2
        
        let vc = VC2()
        
        self.addChildViewController(vc)
        
        let model2 = XHorizontalMenuModel()
        
        model2.title = "C"
        
        model2.view = vc.view
        

        let menuView = XHorizontalMenuView(frame: CGRectMake(0, 0, sw/2.0, 60.0), arr: [model,model2,model1])
        
        let mainView = XHorizontalMainView(frame: CGRectMake(0, 100, 300, 500), menu: menuView)
        
        self.view.addSubview(menuView)
        
        self.view.addSubview(mainView)
        
        
        
        menuView.snp_makeConstraints { (make) in
            make.top.equalTo(20)
            make.height.equalTo(60.0)
            make.leading.equalTo(10.0)
            make.trailing.equalTo(-20.0)
        }
        
        
        
        
        
        
//
//        self.navigationController?.navigationBar.addSubview(v.headMenu)
//        //self.view.addSubview(v.headMenu)
//        v.headMenu.frame = CGRectMake(0, 0, sw, 60.0)
//        
//        v.mainView.snp_makeConstraints { (make) in
//            make.top.equalTo(0.0)
//            make.bottom.equalTo(0.0)
//            make.leading.equalTo(0.0)
//            make.trailing.equalTo(0.0)
//        }
        

    }
    
    
    deinit
    {
        print("VC1 deinit !!!!!!!!!")
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
