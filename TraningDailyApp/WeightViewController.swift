//
//  WeightViewController.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/04/23.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit
import Foundation

class WeightViewController: ViewController {

    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        weightTextField.delegate = self
        weightTextField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func zeroAction(_ sender: Any) {
        writeTexiField(number: self.zero.currentTitle!)
    }
    @IBAction func oneAction(_ sender: Any) {
        writeTexiField(number: self.one.currentTitle!)
    }
    @IBAction func twoAction(_ sender: Any) {
        writeTexiField(number: self.two.currentTitle!)
    }
    @IBAction func threeAction(_ sender: Any) {
        writeTexiField(number: self.three.currentTitle!)
    }
  
    @IBAction func fourAction(_ sender: Any) {
        writeTexiField(number: self.four.currentTitle!)
    }
    @IBAction func fiveAction(_ sender: Any) {
        writeTexiField(number: self.five.currentTitle!)
    }
    @IBAction func sicAction(_ sender: Any) {
        writeTexiField(number: self.six.currentTitle!)
    }
    @IBAction func sevenAction(_ sender: Any) {
        writeTexiField(number: self.seven.currentTitle!)
    }
    @IBAction func eightAction(_ sender: Any) {
        writeTexiField(number: self.eight.currentTitle!)
    }
    @IBAction func nineAction(_ sender: Any) {
        writeTexiField(number: self.nine.currentTitle!)
    }
    @IBAction func myWeight(_ sender: Any) {
        weightTextField.text = "自重"
    }
    @IBAction func clearAction(_ sender: Any) {
        weightTextField.text = ""
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        if weightTextField.text == "" {return}
        
        if weightTextField.text == "自重" {
            weightTextField.text = ""
            return
        }
        
        let text:String = weightTextField.text!
        let endPoint:Int = text.characters.count - 1
        
        weightTextField.text = (text as NSString).substring(to: endPoint)
    }
    
    //テキストを変更する
    private func writeTexiField(number:String){
        
        let text = weightTextField.text
        
        //最初に0は入力できないようにする
        if (text?.characters.count)! <= 0 && number == "0"{
            return
        }
        
        //自重が入力されているとき
        if text == "自重" {
            
            if number == "0"{
                return
            }
            
            weightTextField.text = number
            return
        }
        
        weightTextField.text = text! + number
    }
    
    //テキストフィールドにフォーカスが当たったら呼ばれる
    func textFieldDidBeginEditing(_ textField: UITextField) {
        weightTextField.resignFirstResponder()
    }
    
    //決定ボタンのクリックイベント
    @IBAction func onEnter(_ sender: Any) {
        
        let navigationController = self.navigationController!
        
        let infoVIewController = navigationController.viewControllers[navigationController.viewControllers.count - 2] as! PostViewController
        
        infoVIewController.weightTextField.text = weightTextField.text
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
