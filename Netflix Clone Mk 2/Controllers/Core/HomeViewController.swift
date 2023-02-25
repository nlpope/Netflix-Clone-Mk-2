//
//  HomeViewController.swift
//  Netflix Clone Mk 2
//
//  Created by Noah Pope on 2/5/23.
//
//  first view that shows from boot
//  this is a cocoa touch class
//  studying MVC VS MVVM: Milan Panchal


import UIKit

class HomeViewController: UIViewController {
    
    //this is a subview - the tableview houses collectionView cells
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable) //subview added, viewDidLayoutSubviews() needed
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configureNavbar()
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        homeFeedTable.tableHeaderView = headerView
        //UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
    }
    
    private func configureNavbar() {
        var netflixImage = UIImage(named: "netflixLogo")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: netflixImage, style: .done, target: self, action: nil)
        
    }
    
    /**
     from stack overflow
     
     let googleImage  = UIImage(named: "google")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal).resizeTo(size: CGSize(width: 25, height: 25))
     let googleButton = UIButton()
     googleButton.setBackgroundImage(googleImage, for: .normal)
     googleButton.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
     let googleBarButton = UIBarButtonItem(customView: googleButton)
     
     + ...
     .resizableImage(withCapInsets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)) - rplaces .resize(..)
     */
    
    /**
     original code from Mk 1
     
     private func configureNavbar() {
         var buttonIcon = UIImage(named: "netflixLogo")
         buttonIcon = buttonIcon?.withRenderingMode(.alwaysOriginal)
         navigationItem.leftBarButtonItem = UIBarButtonItem(image: buttonIcon, style: .done, target: self, action: nil)
         
         navigationItem.rightBarButtonItems = [
             UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
             UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
         ]
         navigationController?.navigationBar.tintColor = .white
     }
     
     */
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {return UITableViewCell()}
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //for testing
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
}
