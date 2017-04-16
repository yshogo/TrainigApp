//
//  ViewController.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/03/19.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    
    var textFieldDelegate:UIViewController?

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
    
    //テキストビューでRetutnキーの入力後にキーボードを閉じる
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    //画面にアラートを表示する
    public func alert(title:String,messageText:String,okActition:UIAlertAction,noAction:UIAlertAction){
        
        let alert = UIAlertController(title: title, message: messageText, preferredStyle: .alert)
        
        alert.addAction(okActition)
        alert.addAction(noAction)
        
        present(alert,animated: true, completion: nil)
    }
    
    //画面にアラートを表示する
    public func alert(title:String,messageText:String,okActition:UIAlertAction){
        
        let alert = UIAlertController(title: title, message: messageText, preferredStyle: .alert)
        
        alert.addAction(okActition)
        
        present(alert,animated: true, completion: nil)
        
    }
}

