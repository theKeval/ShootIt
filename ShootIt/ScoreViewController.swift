//
//  ScoreViewController.swift
//  ShootIt
//
//  Created by Keval on 5/28/21.
//

import UIKit
import CoreData

class ScoreViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    func getContext() -> NSManagedObjectContext {
        return appDelegate.persistentContainer.viewContext
    }

    @IBOutlet weak var tvScore: UITableView!
    @IBAction func btnRestart(_ sender: Any) {
    }
    
    var players = [PlayerModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getData()
        
        tvScore.delegate = self
        tvScore.dataSource = self
        tvScore.tableFooterView = UIView()
    }
    
    @IBAction func onRestartClick(_ sender: Any) {
        performSegue(withIdentifier: "segue_restart", sender: self)
    }
    
    func getData() {
        let query = NSFetchRequest<NSFetchRequestResult>(entityName: "Players")
        query.sortDescriptors = [NSSortDescriptor(key: "score", ascending: false)]
        
        query.returnsObjectsAsFaults = false;
        
        do {
            let results = try getContext().fetch(query)
            
            print("Rows found in db: " , results.count)
            
            if (results.count > 0) {
                
                if let rows = results as? [NSManagedObject] {
                    for player in rows {
                        let playerName = player.value(forKey: "name") as! String
                        let playerScore = player.value(forKey: "score") as! Int16
                        
                        players.append(PlayerModel(_name: playerName, _score: playerScore))
                    }
                }
                
            }
            else {
                // list = []
                print("Nothing is found!!")
            }
            
        }
        catch {
            print("Some error occured when fetching the data!!")
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ScoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player = players[indexPath.row]
        let cell = tvScore.dequeueReusableCell(withIdentifier: "CellPlayerScore") as! CellPlayerScore
        
        cell.setup(name: player.name, score: player.score)
        return cell
    }
    
}
