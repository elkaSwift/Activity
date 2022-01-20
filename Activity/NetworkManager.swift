//
//  NetworkManager.swift
//  Activity
//
//  Created by Елисей Мищенко on 19.01.2022.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchData(url: String, completion: @escaping(Activity) -> Void) {
        guard let url = URL(string: Link.exampleOne.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let activity = try JSONDecoder().decode(Activity.self, from: data)
                DispatchQueue.main.async {
                    completion(activity)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
