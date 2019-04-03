//
//  UserTableViewCell.swift
//  MVPSample
//
//  Created by Yahia MacBookPro on 4/1/19.
//  Copyright © 2019 Yahia Mosaad. All rights reserved.
//
import UIKit
import Foundation

class UserTableViewCell: UITableViewCell, UserCellView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        userImageView.layer.borderWidth = 1
        userImageView.layer.masksToBounds = false
        userImageView.layer.borderColor = UIColor.lightGray.cgColor
        userImageView.layer.cornerRadius = userImageView.frame.height/2
        userImageView.clipsToBounds = true
    }
    
    
    
    func displayName(name: String) {
        nameLabel.text = name
    }
    
    func displayEmail(email: String) {
        emailLabel.text = email
    }
    
    func displayAddress(address: String) {
        addressLabel.text = address
    }
//    func setUsresImageViewTag(index: Int) {
//        newsImageView.tag = index
//    }
//    func displayImage(imageURL: String, indexForRow: Int) {
//        
//        newsImageView.loadImageUsingCache(withUrl: imageURL, cellIndexPathRow: indexForRow)
//        
//    }

}
