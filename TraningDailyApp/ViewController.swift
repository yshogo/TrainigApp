//
//  ViewController.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/03/19.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //指定されたIdentifyに画面遷移する
    public func next(indentify:String){
        let targetViewController = self.storyboard!.instantiateViewController( withIdentifier:  indentify)
        self.present( targetViewController, animated: true, completion: nil)
    }

}

