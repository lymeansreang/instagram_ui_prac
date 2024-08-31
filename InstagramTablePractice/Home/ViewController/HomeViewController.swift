import UIKit

class HomeViewController: UIViewController {
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeViewCell.self, forCellReuseIdentifier: HomeViewCell.reuseIdentifier)
        tableView.register(StoryTableViewCell.self, forCellReuseIdentifier: StoryTableViewCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    public var homes : [HomeModel] = [
        HomeModel(profile: "profile", name: "Chan Dara", postImage: "Image1", like: "heart", comment: "chat", share: "send",save: "bookmark", descriptions: "Best view in Tokyo"),
        HomeModel(profile: "profile1", name: "Keo Bopha", postImage: "Image2", like: "heart", comment: "chat", share: "send",save: "bookmark", descriptions: "Night View"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Instagram"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
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
        guard indexPath.row != 0 else {
                    return 130
                }
                return UITableView.automaticDimension
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row != 0 else {
            let cell = tableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.reuseIdentifier, for: indexPath) as! StoryTableViewCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.reuseIdentifier, for: indexPath) as! HomeViewCell
        let home = homes[indexPath.row - 1]
        cell.profileImageView.image = UIImage(named: home.profile)
        cell.userNameLabel.text = home.name
        cell.postImageView.image = UIImage(named: home.postImage)
        cell.likeButtonImageView.image = UIImage(named: home.like)
        cell.commentButtonImageView.image = UIImage(named: home.comment)
        cell.shareButtonImageView.image = UIImage(named: home.share)
        cell.saveButtonImageView.image = UIImage(named: home.save)
        cell.descriptionLabel.text = home.descriptions
        return cell

    }
}


