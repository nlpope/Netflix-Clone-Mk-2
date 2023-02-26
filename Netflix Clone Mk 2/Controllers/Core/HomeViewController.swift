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
        
        configureNavBar()
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        homeFeedTable.tableHeaderView = headerView
        //UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
    }
    
    //CREATE A UIBARBUTTONITEM W A CUSTOM VIEW (TO ADJUST THE SCALE & ALIGNMENT)
    private func configureNavBar() {
        let netflixBtn = UIButton(type: .custom) // a custom UIButton [of type UIView]
        netflixBtn.setImage(UIImage(named: "netflixLogo"), for: .normal) //put an image in that custom button/view
        //netflixBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20) //OG stackOverflow code - unsure if this line is necessary

        
        let leftMenuItem = UIBarButtonItem(customView: netflixBtn)
        //now for the key component of this method - width + height constraints
        let currWidth = leftMenuItem.customView?.widthAnchor.constraint(equalToConstant: 35)
        currWidth?.isActive = true
        let currHeight = leftMenuItem.customView?.heightAnchor.constraint(equalToConstant: 35)
        currHeight?.isActive = true
        self.navigationItem.leftBarButtonItem = leftMenuItem //of type UIBarButtonItem (w a custom view)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }

}

//MARK: DELEGATE & DATASOURCE METHODS

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
