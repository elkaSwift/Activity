//
//  Activity.swift
//  Activity
//
//  Created by Елисей Мищенко on 16.01.2022.
//

import Foundation

struct Activity: Decodable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
    let accessibility: Double
    
    var description: String {
                    """
        activity: \(activity)
        type: \(type)
        participants: \(participants)
        price: \(price)
        link: \(link)
        key: \(key)
        accessibility: \(accessibility)
        """
    }
}
