//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Bektur Mamytov on 18/3/23.
//

import UIKit

class ConversionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        
        gradient.colors = [UIColor.systemBlue.cgColor,
                           UIColor.systemCyan.cgColor,
                           UIColor.systemMint.cgColor,
                           UIColor.systemMint.cgColor]
        
        gradient.shouldRasterize = true
        view.layer.insertSublayer(gradient, at: 0)
    }
    
}

