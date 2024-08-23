//
//  ViewController.swift
//  InstagramTablePractice
//
//  Created by Rithiya on 23/8/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .blue
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeViewCell.self, forCellReuseIdentifier: HomeViewCell.reuseIdentifier)
        tableView.register(StoryTableViewCell.self, forCellReuseIdentifier: StoryTableViewCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var homes : [HomeModel] = [
        HomeModel(profile: "profile")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    private func setupView(){
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homes.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row != 0 else {
            let cell = tableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.reuseIdentifier, for: indexPath) as! StoryTableViewCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.reuseIdentifier, for: indexPath) as! HomeViewCell
//        let home = homes[indexPath.row - 1]
        return cell

    }
}


