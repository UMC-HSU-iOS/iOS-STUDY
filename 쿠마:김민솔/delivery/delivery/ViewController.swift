//
//  ViewController.swift
//  delivery
//
//  Created by 김민솔 on 2023/09/18.
//

import UIKit

class ViewController: UIViewController, UITabBarControllerDelegate {
    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarController = UITabBarController()
        tabBarController.delegate = self
        
        myView.layer.cornerRadius = 30
        // Do any additional setup after loading the view.
    }


}

