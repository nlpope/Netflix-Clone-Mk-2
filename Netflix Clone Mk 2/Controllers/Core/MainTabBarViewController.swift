//
//  ViewController.swift
//  Netflix Clone Mk 2
//
//  Created by Noah Pope on 2/3/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        //child view controllerss
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4  = UINavigationController(rootViewController: DownloadsViewController())

        setViewControllers([vc1, vc2, vc3, vc4], animated: true )
    }


}

