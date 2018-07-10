//
//  InteruptGameViewController.swift
//  Pierre_Feuille_Ciseaux
//
//  Created by Erwan seveno on 10/07/2018.
//  Copyright © 2018 Erwan seveno. All rights reserved.
//

import UIKit

class InteruptGameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var gameTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.gameTableView.register(UINib.init(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: "gameTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.gameTableView.reloadData()
    }
    
    //MARK - DELEGATE
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (allGame.count)
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return (1)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : GameTableViewCell = tableView.dequeueReusableCell(withIdentifier: "gameTableViewCell") as! GameTableViewCell
        
        cell.fillCell(match: allGame[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fightVC = FightViewController()
        fightVC.playerA = allGame[indexPath.row].0
        fightVC.playerB = allGame[indexPath.row].1
        allGame.remove(at: indexPath.row)
        self.navigationController?.pushViewController(fightVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            allGame.remove(at: indexPath.row)
        }
        self.gameTableView.reloadData()
    }
    
}
