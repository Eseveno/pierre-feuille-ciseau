//
//  ViewController.swift
//  Pierre_Feuille_Ciseaux
//
//  Created by Erwan seveno on 10/07/2018.
//  Copyright © 2018 Erwan seveno. All rights reserved.
//

import UIKit

var allGame = [(Player, Player)]()

class ViewController: UIViewController {

    
    var vc = UIViewController()
    
    @IBOutlet weak var interuptedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        if allGame.count > 0 {
            interuptedButton.isHidden = false
        } else {
            interuptedButton.isHidden = true
        }
    }
    
    @IBAction func buttonPlayPushed(_ sender: UIButton) {
        
        let backItem = UIBarButtonItem()
        backItem.title = "Interrompre"
        navigationItem.backBarButtonItem = backItem
        
        let fightVC = FightViewController()
        if (sender.accessibilityIdentifier == "pva"){
            fightVC.playerA.isAI = false
            fightVC.playerB.isAI = true
            self.navigationController?.pushViewController(fightVC, animated: true)
        } else if (sender.accessibilityIdentifier == "ava"){
            fightVC.playerA.isAI = true
            fightVC.playerB.isAI = true
            self.navigationController?.pushViewController(fightVC, animated: true)
        } else {
            return
        }
        
    }
    @IBAction func interuptedButtonPushed(_ sender: UIButton) {
        
        let backItem = UIBarButtonItem()
        backItem.title = "Retour"
        navigationItem.backBarButtonItem = backItem
        
        let interuptVC = InteruptGameViewController()
        self.navigationController?.pushViewController(interuptVC, animated: true)
    }
    
    

}

