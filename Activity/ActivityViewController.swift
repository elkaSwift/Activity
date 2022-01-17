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
    
    //MARK: - IBOutlets
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var activityButton: UIButton!
    
    //MARK: - properties
    var activity: Activity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityButton.layer.cornerRadius = 10
        activityButton.backgroundColor = .clear
        activityButton.layer.cornerRadius = 10
        activityButton.layer.borderWidth = 3
        activityButton.layer.borderColor = UIColor.white.cgColor
        
        let firstColor = UIColor(red: 58 / 255, green: 17 / 255, blue: 135 / 255, alpha: 1).cgColor
        let secondColor = UIColor(red: 146 / 255, green: 69 / 255, blue: 144 / 255, alpha: 1).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [firstColor, secondColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    //MARK: - IBActions
    @IBAction func activityButton(_ sender: UIButton) {
        exampleOneButtonPressed()
        if ((activity ?? nil) != nil) {
            activityLabel.text = """
activity: \(activity.activity)
type: \(activity.type)
participants: \(activity.participants)
price: \(activity.price)
link: \(activity.link)
key: \(activity.key)
accessibility: \(activity.accessibility)
"""
        } else {
            print("error")
        }
    }
    
    //MARK: - public methods
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


