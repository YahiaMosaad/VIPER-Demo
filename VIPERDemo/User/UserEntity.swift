//
//  UserEntity.swift
//  VIPERDemo
//
//  Created by Yahia MacBookPro on 4/3/19.
//  Copyright © 2019 Yahia Mosaad. All rights reserved.
//

import Foundation

struct UserEntity: Codable {
    let name: String!
    let email: String!
    let address: AddressData!
    private enum CodingKeys: String, CodingKey {
        case name
        case email
        case address
    }
}

struct AddressData: Codable {
    let street: String!
    let suite: String!
    private enum CodingKeys: String, CodingKey {
        case street
        case suite
    }
}
