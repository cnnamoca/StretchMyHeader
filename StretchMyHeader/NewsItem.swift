//
//  NewsItem.swift
//  StretchMyHeader
//
//  Created by Carlo Namoca on 2017-11-07.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

import Foundation
import UIKit

struct NewsItem {
    enum NewsCategory {
        case World
        case Europe
        case MiddleEast
        case Africa
        case AsiaPacific
        case Americas
        
        func toString() -> String{
            switch self {
            case .World:
                return "World"
            case .Americas:
                return "Americas"
            case .Europe:
                return "Europe"
            case .MiddleEast:
                return "Middle East"
            case .Africa:
                return "Africa"
            case .AsiaPacific:
                return "Asia-Pacific"
            }
        }
        
        func toColor() -> UIColor{
            switch self {
            case .World:
                return UIColor.red
            case .Americas:
                return UIColor.blue
            case .Europe:
                return UIColor.green
            case .MiddleEast:
                return UIColor.yellow
            case .Africa:
                return UIColor.orange
            case .AsiaPacific:
                return UIColor.purple
            }
        }
    }
    
    let category: NewsCategory
    let summary: String
    
}
