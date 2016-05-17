# XHorizontalView
联动横向滚动菜单view  类似网易新闻框架  菜单和主view可拆分随意设定位置

一 说明

类似于网易新闻 腾讯新闻等 顶部带有N个选项 对应下面N个View  可以关联滑动 

这里把菜单和主view拆分开了  两者位置大小没有关系 可以随便放到哪个view

可以自定义菜单字体颜色 缩放大小等 菜单切换时菜单字体颜色带渐变过度效果

支持各个屏幕方向 支持自动/代码布局

![image](https://github.com/xpf0000/XHorizontalView/blob/master/XHorizontalView/Untitled.gif)   

![image](https://github.com/xpf0000/XHorizontalView/blob/master/XHorizontalView/Untitled1.gif) 

二 项目引用

Source文件夹中两个文件直接拷贝到项目中

三 使用

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
        
  关键代码:
  
        let menuView = XHorizontalMenuView(frame: CGRectMake(0, 0, sw/2.0, 60.0), arr: [model,model2,model1])
        
        let mainView = XHorizontalMainView(frame: CGRectMake(0, 100, 300, 500), menu: menuView)
        
        
  
