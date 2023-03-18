//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Bektur Mamytov on 18/3/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
        
        let firstView = UIView(frame: firstFrame)
        firstView.backgroundColor = .blue
        view.addSubview(firstView)
        
        let secondFrame = CGRect(x: 20, y: 30, width: 50, height: 50)
        let secondView = UIView(frame: secondFrame)
        secondView.backgroundColor = .green
        firstView.addSubview(secondView)
    }
}

