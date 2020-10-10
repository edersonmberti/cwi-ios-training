//
//  ViewController.swift
//  Forca
//
//  Created by Ederson Machado on 06/10/20.
//  Copyright © 2020 Ederson Machado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game: HangingGame = HangingGame.random()
    
    var index: Int = 1

    @IBOutlet weak var puppetImageView: UIImageView!
    @IBOutlet weak var letterTextField: UITextField!
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var maskedWordLabel: UILabel!
    
    @IBAction func handleChangeText(_ sender: Any) {
        letterTextField.text = letterTextField.text?.last?.uppercased()
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        if let letter = letterTextField.text {
            game.attemptLetter(letter)
            updateScreen()
        }
    }
    
    @IBAction func onRestart(_ sender: Any) {
        newGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateScreen()
    }
    
}

extension ViewController {
    
    private func updateScreen() {
        guessLabel.text = "A dica é: \(game.guess)"
        maskedWordLabel.attributedText = game.maskedWord.spaced
        guessLabel.attributedText = formatPreviousAttempts()
        
        letterTextField.text = ""
        updatePuppet()
        
        if game.defeat {
            alertLoser()
        } else if game.win {
            alertWinner()
        }
    }
    
    private func formatPreviousAttempts() -> NSAttributedString {
        game.previousAttempts.reduce(NSMutableAttributedString()){ (text, letter) in
            if game.word.contains(letter) {
                text.append(letter.setGreenColor)
            } else {
                text.append(letter.setRedColor)
            }
            
            return text
        }.spaced
    }
    
    var action: UIAlertAction { UIAlertAction(title: "Jogar novamente", style: .default) { _ in
        self.newGame()
    }}
    
    private func alertLoser() {
        let alert = UIAlertController(title: "Deu ruim!", message: "Te liga na próxima.", preferredStyle: .alert)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func alertWinner() {
        let alert = UIAlertController(title: "Boa meu padrinho!", message: "Mandou bem demais.", preferredStyle: .alert)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func newGame() {
        game = HangingGame.random()
        updateScreen()
    }
 
    private func updatePuppet() {
        let image: UIImage?
        
        if game.defeat {
            image = UIImage(named: "bonecao_completo_e_mortinho")
        } else if game.errors == 0 {
            image = nil
        } else {
            image = UIImage(named: "bonecao_fase_\(game.errors)")
        }
        
        UIView.transition(
            with: puppetImageView,
            duration: 0.4,
            options: .transitionCrossDissolve,
            animations: {
                self.puppetImageView.image = image
            },
            completion: nil)
    }
    
}
