//
//  FightViewController.swift
//  Pierre_Feuille_Ciseaux
//
//  Created by Erwan seveno on 10/07/2018.
//  Copyright © 2018 Erwan seveno. All rights reserved.
//

import UIKit

class FightViewController: UIViewController {

    
    var playerA = Player()
    var playerB = Player()
    
    @IBOutlet weak var scoreALabel: UILabel!
    @IBOutlet weak var scoreBLabel: UILabel!
    
    @IBOutlet weak var symbolAImage: UIImageView!
    @IBOutlet weak var symbolBImage: UIImageView!
    
    @IBOutlet weak var pierreButton: UIButton!
    @IBOutlet weak var feuilleButton: UIButton!
    @IBOutlet weak var ciseauxButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupFront()
        self.setupGameMode()
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        allGame.append((self.playerA, self.playerB))
    }
    
    //MARK: - FRONT
    
    func setupFront(){
        self.scoreALabel.text = String(playerA.score)
        self.scoreBLabel.text = String(playerB.score)
        
        if (playerA.whatPlayed != nil && playerB.whatPlayed != nil){
           self.symbolAImage.image = changeImage(player: playerA)
           self.symbolBImage.image = changeImage(player: playerB)
        }
        
    }
    
    func setupGameMode(){
        if (playerA.isAI && playerB.isAI){
            self.pierreButton.isHidden = true
            self.feuilleButton.isHidden = true
            self.ciseauxButton.isHidden = true
            self.nextButton.isHidden = false
        }
    }
    
    func changeImage(player : Player) -> UIImage{
        if (player.whatPlayed == .pierre){
            return #imageLiteral(resourceName: "pierre")
        } else if (player.whatPlayed == .ciseaux){
            return #imageLiteral(resourceName: "ciseaux")
        } else {
            return #imageLiteral(resourceName: "feuille")
        }
    }
    
    //MARK: - buttonPushed
    
    @IBAction func nextButtonPushed(_ sender: UIButton) {
        botModePlay()
    }
    
    @IBAction func symbolPushed(_ sender: UIButton) {
        if (sender.accessibilityIdentifier == "pierre"){
            self.playerA.whatPlayed = .pierre
        } else if (sender.accessibilityIdentifier == "feuille"){
            self.playerA.whatPlayed = .feuille
        } else if (sender.accessibilityIdentifier == "ciseaux"){
            self.playerA.whatPlayed = .ciseaux
        }
        
        self.playerB.whatPlayed = self.playerB.AIrandplay()
        checkWhoWinTurn(playerAHand: self.playerA.whatPlayed!, playerBHand: self.playerB.whatPlayed!)
        setupFront()
    }
    
    //MARK: - GAME RULE
    
    func checkWhoWinTurn(playerAHand: Symbol, playerBHand: Symbol){
        if playerAHand == playerBHand{
            
        } else if playerAHand == .ciseaux && playerBHand == .feuille{
            self.playerA.score += 1
        } else if playerAHand == .pierre && playerBHand == .ciseaux{
            self.playerA.score += 1
        } else if playerAHand == .feuille && playerBHand == .pierre{
            self.playerA.score += 1
        } else {
            self.playerB.score += 1
        }
    }
    
    func botModePlay(){
        self.playerA.whatPlayed = self.playerA.AIrandplay()
        self.playerB.whatPlayed = self.playerB.AIrandplay()
        checkWhoWinTurn(playerAHand: self.playerA.whatPlayed!, playerBHand: self.playerB.whatPlayed!)
        setupFront()
    }
    
}
