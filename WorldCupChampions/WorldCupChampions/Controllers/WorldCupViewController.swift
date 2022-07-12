//
//  WolrdCupViewController.swift
//  WorldCupChampions
//
//  Created by Diego Ferreira on 12/07/22.
//

import UIKit

class WorldCupViewController: UIViewController {
    
    @IBOutlet weak var winnerImageView: UIImageView!
    @IBOutlet weak var viceImageView: UIImageView!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var viceLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var worldCup: WorldCup!

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupView()
    }
    
    private func setup() {
        title = "World Cup \(worldCup.year)"
    }
    
    private func setupView() {
        winnerImageView.image = UIImage(named: "\(worldCup.winner)")
        viceImageView.image = UIImage(named: "\(worldCup.vice)")
        winnerLabel.text = worldCup.winner
        viceLabel.text = worldCup.vice
        scoreLabel.text = "\(worldCup.winnerScore) x \(worldCup.viceScore)"
    }
}
