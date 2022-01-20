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
    
    func fetchDataUsingAlamofire(completion: @escaping(Activity) -> Void) {
        AF.request(Link.exampleOne.rawValue, method: .get)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let activitysData = value as? [String: Any] else { return }
                    let activity = Activity(activityData: activitysData)
                    DispatchQueue.main.async {
                        completion(activity)
                    }
                    print(activity)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
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
