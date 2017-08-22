//
//  Utils.swift
//  TestOne
//
//  Created by ya Liu on 2017/8/17.
//  Copyright © 2017年 wasterd. All rights reserved.
//

import Foundation


func dateFromString(_ date: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.date(from: date)!
}

func stringFromDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: date)
}
