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
    
    init(activityData: [String: Any]) {
        activity = activityData["activity"] as? String ?? ""
        type = activityData["type"] as? String ?? ""
        participants = activityData["participants"] as? Int ?? 0
        price = activityData["price"] as? Double ?? 0
        link = activityData["link"] as? String ?? ""
        key = activityData["key"] as? String ?? ""
        accessibility = activityData["accessibility"] as? Double ?? 0
    }
    
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
