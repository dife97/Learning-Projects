//
//  WorldCupTableViewCell.swift
//  WorldCupChampions
//
//  Created by Diego Ferreira on 12/07/22.
//

import UIKit

class WorldCupTableViewCell: UITableViewCell {
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var viceLabel: UILabel!
    @IBOutlet weak var winnerScoreLabel: UILabel!
    @IBOutlet weak var viceScoreLabel: UILabel!
    @IBOutlet weak var winnerImageView: UIImageView!
    @IBOutlet weak var viceImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func prepare(with cup: WorldCup) {
        yearLabel.text = "\(cup.year)"
        countryLabel.text = cup.country
        winnerLabel.text = cup.winner
        viceLabel.text = cup.vice
        winnerScoreLabel.text = cup.winnerScore
        viceScoreLabel.text = cup.viceScore
        winnerImageView.image = UIImage(named: cup.winner)
        viceImageView.image = UIImage(named: cup.vice)
    }
}
