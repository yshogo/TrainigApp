//
//  NumViewController.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/04/20.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import UIKit

class NumViewController: ViewController {
    
    @IBOutlet weak var numTextField: UITextField!
    
    var numberPicker:UIPickerView = UIPickerView()
    var numberToolbar:UIToolbar = UIToolbar()
    
    var piclerDataSource:NumPickerDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initPickerData()
        createNumberToolbar()
    }
    
    //Pickerの初期設定
    private func initPickerData(){
        
        piclerDataSource = NumPickerDataSource()
        numberPicker.delegate = piclerDataSource
        numberPicker.dataSource = piclerDataSource
        piclerDataSource?.textField = numTextField
        
        numberPicker.frame = CGRect(x:0,y: 0,width:self.view.bounds.width,height:100.0)
        numTextField.inputView = numberPicker
        
    }
    
    /// 最大重量のTollbarを生成する
    private func createNumberToolbar(){
        //Toolbarの生成
        numberToolbar = UIToolbar(frame: CGRect(x:0,y:self.view.frame.size.height/6,width:self.view.frame.size.width,height:40.0))
        numberToolbar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        numberToolbar.backgroundColor = UIColor.black
        numberToolbar.barStyle = UIBarStyle.black
        numberToolbar.tintColor = UIColor.white
        
        //ToolBarを閉じるボタンを追加
        let myToolBarButton = UIBarButtonItem(title: "完了", style: .bordered, target: self, action: #selector(NumViewController.tappedToolBarBtn))
        myToolBarButton.tag = 1
        numberToolbar.items = [myToolBarButton]
        
        numTextField.inputAccessoryView = numberToolbar
    }

    @objc private func tappedToolBarBtn(sender: AnyObject?) {
        numTextField.resignFirstResponder()
    }
    
    //決定ボタンのクリックイベント
    @IBAction func onEnter(_ sender: Any) {
        
        let navigationController = self.navigationController!
        
        let infoViewController = navigationController.viewControllers[navigationController.viewControllers.count - 2] as! PostViewController
        
        if self.numTextField.text == "" {
            let okAction = UIAlertAction(title: "ok", style: .default, handler: {
                (action:UIAlertAction!) -> Void in
            })
            
            alert(title: "エラー", messageText: "回数を選択してください", okActition: okAction)
            
            return
        }
        
        infoViewController.numTextField.text = self.numTextField.text
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
