//
//  UIVC+Extension.swift
//  RxSimpleTodo
//
//  Created by Seunghun Lee on 2017-08-24.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import UIKit

extension UIViewController {
  static var instance: UIViewController {
    let storyboardName = String(describing: self)
    let storyboard = UIStoryboard(name: storyboardName, bundle: nil)

    guard let viewController = storyboard.instantiateInitialViewController() else {
      fatalError("There is no initial UIViewController")
    }

    return viewController
  }
}
