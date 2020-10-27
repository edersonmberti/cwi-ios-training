//
//  CardCollectionViewCell.swift
//  MemoryGame
//
//  Created by Ederson Machado on 25/10/20.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    static let identifier = "CardCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setLayout()
    }
    
    public func configure(with card: Game.MemoryCard) {
        let imageName = card.isFaceUp ? card.content : "memory_game"
        
        self.isHidden = card.isMatched
        imageView.image = UIImage(named: imageName)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CardCollectionViewCell", bundle: nil)
    }
    
    private func setLayout() {
        self.layer.masksToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowRadius = 8
        containerView.layer.cornerRadius = 8
    }
 
}
