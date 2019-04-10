//
//  UserTableViewCell.swift
//  MVPSample
//
//  Created by Yahia MacBookPro on 4/1/19.
//  Copyright © 2019 Yahia Mosaad. All rights reserved.
//
import UIKit
import Foundation

class UserTableViewCell: UITableViewCell {
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

}
