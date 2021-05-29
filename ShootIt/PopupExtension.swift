//
//  PopupExtension.swift
//  ShootIt
//
//  Created by Keval on 5/29/21.
//

import Foundation
import UIKit

extension UIViewController {
    func showPopUp(header: String, message: String) {
        let alert = UIAlertController(title: header, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
