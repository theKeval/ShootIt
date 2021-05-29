//
//  CellPlayerScore.swift
//  ShootIt
//
//  Created by Keval on 5/29/21.
//

import UIKit

class CellPlayerScore: UITableViewCell {

    @IBOutlet weak var uiName: UILabel!
    @IBOutlet weak var uiScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(name: String, score: Int16) {
        uiName.text = name
        uiScore.text = String(score)
    }

}
