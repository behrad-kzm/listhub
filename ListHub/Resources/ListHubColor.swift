//
//  ListHubColors.swift
//  ListHub
//
//  Created by Salar Soleimani on 2020-04-14.
//  Copyright © 2020 BEKSAS. All rights reserved.
//

import Foundation
import UIKit

enum ListHubColor {
  case background
  case text
  
  case custom(hexString: String, alpha: Double)
  case customWithDarkModeString(hexStringForDarkMode: String, hexStringForLightMode: String, alpha: Double)
  case customWithDarkModeColor(colorForDarkMode: UIColor, colorForLightMode: UIColor, alpha: Double)
  
  func withAlpha(_ alpha: Double) -> UIColor {
    return self.value.withAlphaComponent(CGFloat(alpha))
  }
}

extension ListHubColor {
  
  var value: UIColor {
    var instanceColor = UIColor.clear
    
    switch self {
    case .background:
      instanceColor = UIColor.UITraitCollectionColor(darkModeColor: UIColor.black, lightModeColor: UIColor.white)
    case .text:
      instanceColor = UIColor.UITraitCollectionColor(darkModeColor: UIColor(hexString: "#ececec"), lightModeColor: UIColor(hexString: "#9B9B9B"))
      
      
      
    case .custom(let hexString, let opacity):
      instanceColor = UIColor(hexString: hexString).withAlphaComponent(CGFloat(opacity))
    case .customWithDarkModeString(let hexStringForDarkMode, let hexStringForLightMode, let opacity):
      instanceColor = UIColor.UITraitCollectionColor(darkModeHexString: hexStringForDarkMode, lightModeHexString: hexStringForLightMode).withAlphaComponent(CGFloat(opacity))
    case .customWithDarkModeColor(let colorForDarkMode, let colorForLightMode, let opacity):
      UIColor.UITraitCollectionColor(darkModeColor: colorForDarkMode, lightModeColor: colorForLightMode).withAlphaComponent(CGFloat(opacity))
    }
    return instanceColor
  }
}

