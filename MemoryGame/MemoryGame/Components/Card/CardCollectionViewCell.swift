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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setLayout()
    }
    
    public func configure(with card: Game.MemoryCard) {
        imageView.image = UIImage(named: card.content)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CardCollectionViewCell", bundle: nil)
    }
    
    private func setLayout() {
        self.backgroundColor = .red
        self.layer.cornerRadius = 8
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.50
        self.layer.shadowRadius = 12
        self.layer.shadowColor = UIColor.black.cgColor
    }
 
}
