//
//  ViewController.swift
//  Forca
//
//  Created by Ederson Machado on 06/10/20.
//  Copyright © 2020 Ederson Machado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var puppetImageView: UIImageView!
    
    var index: Int = 1

    @IBAction func onSubmit(_ sender: Any) {
        dismissKeyboard()
    }
    
    @IBAction func onRestart(_ sender: Any) {
        index += 1
        
        UIView.transition(
            with: puppetImageView,
            duration: 0.4,
            options: .transitionCrossDissolve,
            animations: {
                self.puppetImageView.image = UIImage(named: "bonecao_fase_\(self.index)")
            },
            completion: nil)
        
        if (index == 5) {
            index = 1
        }
    }
    
}

