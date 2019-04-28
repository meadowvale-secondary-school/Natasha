//
//  CustomerInfo.swift
//  4.9-ComplexInputScreens:HotelApp
//
//  Created by Student04 on 2019-04-28.
//  Copyright © 2019 Student04. All rights reserved.
//

import Foundation

struct Registration {
    var firstName: String
    var lastName: String
    var emailAddress: String
    
    var checkInDate: String
    var checkOutDate: String
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    var roomType: RoomType
    var wifi: Bool
}

struct RoomType: Equatable {
    var id: Int
    var name: String
    var shortName: String
    var price: Int
}

//Equatable Protocol Implementation for RoomType (comparing instances of RoomType)
func ==(lhs: RoomType, rhs: RoomType) -> Bool {
    return lhs.id == rhs.id
}



