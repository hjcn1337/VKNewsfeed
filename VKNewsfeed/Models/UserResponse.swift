//
//  UserResponse.swift
//  VKNewsfeed
//
//  Created by Ростислав Ермаченков on 05.12.2020.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
