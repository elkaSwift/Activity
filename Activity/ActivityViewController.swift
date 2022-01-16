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
    
    @IBOutlet weak var ActivityLabel: UILabel!
    @IBOutlet weak var ActivityButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ActivityButton.layer.cornerRadius = 10
        exampleOneButtonPressed()
    }

    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the results in the Debug aria",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see error in the Debug aria",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }


}

extension ActivityViewController {
    private func exampleOneButtonPressed() {
        guard let url = URL(string: Link.exampleOne.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let course = try JSONDecoder().decode(Activity.self, from: data)
                self.successAlert()
                print(course)
            } catch {
                self.failedAlert()
                print(error.localizedDescription)
            }
            

        }.resume()
    }
    
}
