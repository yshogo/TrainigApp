    //
//  TrainingMenuData.swift
//  TraningDailyApp
//
//  Created by ShogoYamada on 2017/05/17.
//  Copyright © 2017年 山田尚吾. All rights reserved.
//

import Foundation

class TrainingMenuData{
    
    //胸トレ
    public func breastArray() -> [String]{
        return ["ベンチプレス"
                ,"インクラインベンチプレス"
                ,"デクラインベンチプレス"
                ,"ダンベルベンチプレス"
                ,"ダンベルインクラインプレス"
                ,"ダンベルデクラインプレス"
                ,"マシンフライ"
                ,"ケーブルクロスオーバー"
                ,"マシンチェスト"
                ]
    }
    
    //脚トレ
    public func legArray() -> [String]{
        return ["スクワット"
                ,"レッグプレス"
               ]
    }
    
    public func backArray() -> [String]{
        return ["デットリフト"
                ,"ラットプルダウン"
                ,"バーベルシュラッグ"
                ,"懸垂"
                ,"パーシャルデットリフト"
                ,"ベントオーバーロウ"
                ,"マシンフライ"
               ]
    }
}
