//
//  UIViewController+Keyboard.swift
//  Forca
//
//  Created by Ederson Machado on 06/10/20.
//  Copyright © 2020 Ederson Machado. All rights reserved.
//

import UIKit

public extension UIViewController {
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
