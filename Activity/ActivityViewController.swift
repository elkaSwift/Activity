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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityButton.backgroundColor = .clear
        activityButton.layer.cornerRadius = 10
        activityButton.layer.borderWidth = 3
        activityButton.layer.borderColor = UIColor.white.cgColor
        
        getGradient()
    }
    
    //MARK: - IBActions
    @IBAction func activityButton(_ sender: UIButton) {
       
    }
    
    private func getGradient() {
        let firstColor = UIColor(red: 58 / 255, green: 17 / 255, blue: 135 / 255, alpha: 1).cgColor
        let secondColor = UIColor(red: 146 / 255, green: 69 / 255, blue: 144 / 255, alpha: 1).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [firstColor, secondColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
    



