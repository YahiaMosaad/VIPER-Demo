//
//  AlertView.swift
//  MVPSample
//
//  Created by Yahia MacBookPro on 4/1/19.
//  Copyright © 2019 Yahia Mosaad. All rights reserved.
//

import Foundation

import UIKit

protocol Popupable {
    func showPopup(title: String, message: String, cancelTitle: String)
    func showPopup(title: String, message: String, cancelTitle: String, completion:@escaping (() -> Void))
    func showPopup(title: String, message: String, okTitle: String,
                   cancelTitle: String, completion:@escaping (() -> Void))
}

extension Popupable where Self: UIViewController {
    func showPopup(title: String, message: String, cancelTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func showPopup(title: String, message: String, cancelTitle: String, completion:@escaping (() -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: { (_) in
            completion()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func showPopup(title: String, message: String, okTitle: String, cancelTitle: String,
                   completion:@escaping (() -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: okTitle, style: .default, handler: { (_) in
            completion()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
