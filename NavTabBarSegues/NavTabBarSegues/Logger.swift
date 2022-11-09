//
//  Logger.swift
//  NavTabBarSegues
//
//  Created by user on 08.11.2022.
//

import Foundation
import UIKit

extension UIViewController {
    func printLog(func fName: String = #function, from T: Any = UIViewController.self) -> Void {
        print("\(fName) from \(type(of: T))")
    }
}
