//
//  HomeViewController.swift
//  ShootIt
//
//  Created by Keval on 5/28/21.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    func getContext() -> NSManagedObjectContext {
        return appDelegate.persistentContainer.viewContext
    }

    @IBOutlet weak var field_name: UITextField!
    @IBOutlet weak var btnPlay: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    static var currentPlayerName: String = ""
    
    @IBAction func onPlayClick(_ sender: Any) {
        
        if let name = field_name.text {
            if name.isEmpty {
                showPopUp(header: "Oops", message: "Please enter you name!")
                return
            }
            
            HomeViewController.currentPlayerName = name
            saveData(name: name)
            performSegue(withIdentifier: "segue_startGame", sender: self)
        }
        else {
            showPopUp(header: "Oops", message: "Please enter your name!")
        }
    }
    
    
    func saveData(name: String) {
        let rowObj = NSEntityDescription.insertNewObject(forEntityName: "Players", into: getContext())
        
        rowObj.setValue(name, forKey: "name")
        rowObj.setValue(0, forKey: "score")
        
        do{
            try getContext().save()
            print("Saved")
        }catch{
            print("Error")
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
