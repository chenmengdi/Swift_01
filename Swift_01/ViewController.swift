//
//  ViewController.swift
//  Swift_01
//
//  Created by 陈孟迪 on 2017/11/22.
//  Copyright © 2017年 陈孟迪. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var number = 0.0
    var timer : Timer?
    var label : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       createUI()
    }

    func createUI(){
       
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Reset", style: UIBarButtonItemStyle.plain, target: self, action: #selector(action))
        let w:CGFloat = view.frame.size.width
        let h:CGFloat = view.frame.size.height
        
        
        let rect:CGRect = CGRect(x:0,y:30,width:w,height:h/3)
        label = UILabel(frame:rect)
        label?.font = UIFont.systemFont(ofSize: 50)
        label?.textColor =  UIColor.black
        label?.text = String.init(format: "%0.1f", (number))
        label?.textAlignment = NSTextAlignment.center
        self.view.addSubview(label!)
        
        let array:NSArray = ["开始","暂停"]
        for i in 0..<array.count {
            let button:UIButton = UIButton.init(type: .custom)
            button.frame = CGRect(x:10 + ((w - 30)/2 + 10) * CGFloat(i),y:h/2,width:(w-30)/2,height:h/3)
            button.setTitle(array[i] as? String, for: UIControlState.normal)
            button.setTitleColor(UIColor.black, for: UIControlState.normal)
            button.backgroundColor = UIColor.green
            button.tag = 10+i;
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(button)
        }
    }

    @objc func buttonAction(sender:UIButton){
        
        print(sender.tag)
        let button1 = self.view.viewWithTag(10)

        switch sender.tag {
        case 10:
            print("开始")
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(add), userInfo: nil, repeats: true)
             button1?.isUserInteractionEnabled = false
        case 11:
            print("停止")
            timer?.invalidate()
            button1?.isUserInteractionEnabled = true
        default:
            print("other")
        }
        
    }
    
    @objc func add() {
        number += 0.1
        label?.text = String.init(format: "%0.1f", (number))
        print(String.init(format: "%0.1f", number))
    }
    
    @objc func action(){
        print("重置")
        number = 0.0
        label?.text = String.init(format: "%0.1f", (number))
        timer?.invalidate()
    }
}

