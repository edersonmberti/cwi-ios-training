//
//  ViewController.swift
//  MemoryGame
//
//  Created by Ederson Machado on 10/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    let game = Game()

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func onRestart(_ sender: UIButton) {
        game.restart()
    
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(CardCollectionViewCell.nib(), forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func showWinAlert() {
        var action: UIAlertAction { UIAlertAction(title: "Bacana, bora de novo", style: .default) { _ in
            self.newGame()
        }}
        
        let alert = UIAlertController(title: "Boa, você terminou!", message: "Você precisou de X tentativas para finalziar o jogo da memória.", preferredStyle: .alert)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func newGame() {
        game.restart()
        collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        game.choose(memoryCard: game.cards[indexPath.item])
        collectionView.reloadData()
        
        if (game.win) {
            showWinAlert()
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as! CardCollectionViewCell
        
        cell.configure(with: game.cards[indexPath.item])
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    enum LayoutConstants {
        static let dimension: CGFloat = 110
        static let spacing: CGFloat = 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: LayoutConstants.dimension,
              height: LayoutConstants.dimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: LayoutConstants.spacing,
              left: LayoutConstants.spacing,
              bottom: LayoutConstants.spacing,
              right: LayoutConstants.spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        LayoutConstants.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        LayoutConstants.spacing
    }
    
}
