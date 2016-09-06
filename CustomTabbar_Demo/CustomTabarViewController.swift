//
//  CustomTabarViewController.swift
//  CustomTabbar_Demo
//
//  Created by yd on 16/9/6.
//  Copyright © 2016年 yd. All rights reserved.
//

import UIKit

class CustomTabarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let oneVC = One_ViewController()
        oneVC.tabBarItem.title = "首页"
        oneVC.tabBarItem.image = UIImage(named: "tabbar_company_home")
        oneVC.tabBarItem.selectedImage = UIImage(named: "tabbar_company_home_select")
        
        let twoVC = Two_ViewController()
        twoVC.tabBarItem.title = "动态"
        twoVC.tabBarItem.image = UIImage(named: "tabbar_dynamic")
        twoVC.tabBarItem.selectedImage = UIImage(named: "tabbar_dynamic_selected")
        
        let middleVC = Btn_ViewController()
        self.addCenterButtonWithImage(UIImage(named: "middleImage")!, highlightImage: nil)
        
        
        let secondVC = Three_ViewController()
        secondVC.tabBarItem.title = "广场"
        secondVC.tabBarItem.image = UIImage(named: "tabbar_position_oringin")
        secondVC.tabBarItem.selectedImage = UIImage(named: "tabbar_position_selected")
        
        let fourVC = Five_ViewController()
        fourVC.tabBarItem.title = "广场"
        fourVC.tabBarItem.image = UIImage(named: "tabbar_mine_oringin")
        fourVC.tabBarItem.selectedImage = UIImage(named: "tabbar_mine_selected")
        
        self.viewControllers = [oneVC,twoVC,middleVC,secondVC,fourVC]
        
    }
    
    
    func addCenterButtonWithImage(buttonImage : UIImage,highlightImage:UIImage?) {
        let button = UIButton(type: UIButtonType.Custom)
        button.autoresizingMask = [.FlexibleRightMargin, .FlexibleLeftMargin, .FlexibleBottomMargin, .FlexibleTopMargin]
        button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height)
        button.addTarget(self, action: #selector(self.buttonClick), forControlEvents: .TouchUpInside)
        button.setBackgroundImage(buttonImage, forState: .Normal)
        button.setBackgroundImage(highlightImage, forState: .Highlighted)
        let heightDifference: CGFloat = buttonImage.size.height - self.tabBar.frame.size.height
        if heightDifference < 0 {
            button.center = self.tabBar.center
        }
        else {
            var center = self.tabBar.center
            center.y = center.y - heightDifference / 2.0
            button.center = center
        }

        self.view.addSubview(button)
    }
    
    func buttonClick(){
        NSLog("点击中间按钮")
        
        let customSheet = YXCustomActionSheet()
        let contentArray = [["name": "新浪微博", "icon": "sns_icon_3"], ["name": "QQ空间 ", "icon": "sns_icon_5"], ["name": "QQ ", "icon": "sns_icon_4"], ["name": "微信", "icon": "sns_icon_7"], ["name": "朋友圈", "icon": "sns_icon_8"], ["name": "新浪微博", "icon": "sns_icon_3"], ["name": "QQ空间 ", "icon": "sns_icon_5"], ["name": "微信收藏", "icon": "sns_icon_9"]]
        customSheet.backgroundColor = UIColor.whiteColor()
        customSheet.delegate = self
        customSheet.showInView(UIApplication.sharedApplication().keyWindow, contentArray: contentArray)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}

extension CustomTabarViewController : YXCustomActionSheetDelegate {
    func customActionSheetButtonClick(btn: YXActionSheetButton!) {
        NSLog("第\(btn.tag)个按钮被点击了")
    }
}

