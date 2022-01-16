//
//  ViewController.swift
//  Activity
//
//  Created by Елисей Мищенко on 16.01.2022.
//

import UIKit

enum Link: String {
    case exampleOne = "https://www.boredapi.com/api/activity"
}

class ActivityViewController: UIViewController {
    
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var activityButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var activity: Activity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
    }
    
    @IBAction func activityButton(_ sender: UIButton) {
        exampleOneButtonPressed()
        if ((activity ?? nil) != nil) {
            activityLabel.text = """
Activity: \(activity.activity)
Type: \(activity.type)
Participants: \(activity.participants)
Price: \(activity.price)
link: \(activity.link)
Key: \(activity.key)
Accessibility: \(activity.accessibility)
"""
            
        } else {
         print("error")
        }
    }
    
    func exampleOneButtonPressed() {
       guard let url = URL(string: Link.exampleOne.rawValue) else { return }
       
       URLSession.shared.dataTask(with: url) { data, _, error in
           guard let data = data else {
               print(error?.localizedDescription ?? "No error description")
               return
           }
           
           do {
               let activity = try JSONDecoder().decode(Activity.self, from: data)
               self.activity = activity
               print(activity)
           } catch {
               print(error.localizedDescription)
           }
           
       }.resume()
   }
}


