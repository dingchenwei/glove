//
//  GloveModel.swift
//  glove
//
//  Created by 丁晨炜 on 17/1/31.
//  Copyright © 2017年 zju. All rights reserved.
//

import Foundation

struct trainItem {
    var time:String
    var action:String
    var helpPercent:Double
    var compeletePercent:Double
}

class storage{
    init() {
    }
    func addItem(time:String, action:String, helpPercent:Double, completePercent:Double) {
        let newItem = trainItem(time: time, action: action, helpPercent: helpPercent, compeletePercent: completePercent)
//        newItem.time = time
//        newItem.action = action
//        newItem.helpPercent = helpPercent
//        newItem.compeletePercent = completePercent
        trainItems.append(newItem)
    }
    var trainItems = [trainItem]()
}
