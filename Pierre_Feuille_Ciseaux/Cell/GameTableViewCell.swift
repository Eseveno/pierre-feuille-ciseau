//
//  GameTableViewCell.swift
//  Pierre_Feuille_Ciseaux
//
//  Created by Erwan seveno on 10/07/2018.
//  Copyright © 2018 Erwan seveno. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var playerALabel: UILabel!
    @IBOutlet weak var playerBLabel: UILabel!
    
    @IBOutlet weak var scoreALabel: UILabel!
    @IBOutlet weak var scoreBLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillCell(match: (Player, Player)) {
        if (match.0.isAI){
           self.playerALabel.text = "AI"
        } else {
            self.playerALabel.text = "PLAYER"
        }
        if (match.1.isAI){
            self.playerBLabel.text = "AI"
        } else {
            self.playerBLabel.text = "PLAYER"
        }
        
        scoreALabel.text = String(match.0.score)
        scoreBLabel.text = String(match.1.score)
    }
    
}
