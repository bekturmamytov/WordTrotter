//
//  QuizViewController.swift
//  WorldTrotter
//
//  Created by Bektur Mamytov on 22/3/23.
//

import UIKit

class QuizViewController: UIViewController {

    override func viewDidLoad() {
        print("QuizViewController is loaded")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = generateRandomColor()
    }
    
    //method to generate random color
    func generateRandomColor() -> UIColor {
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
            
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
            
        return randomColor
        }

}
