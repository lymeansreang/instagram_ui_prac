//
//  StoryViewCell.swift
//  InstagramTablePractice
//
//  Created by Rithiya on 23/8/24.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    static var reuseIdentifier: String {
        return "\(self)"
    }
    
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - (10 * 9), height: 160)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        collectionView.register(StoryPostCollectionViewCell.self, forCellWithReuseIdentifier: "StoryPostCollectionViewCell")
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    public var storyPosts : [StoryPostModel] = [
        StoryPostModel(userProfile: "profile1"),
    ]
    
    public var stories : [StoryModel] = [
        StoryModel(profile: "profile",name: "Sok"),
        StoryModel(profile: "profile",name: "Sok"),
        StoryModel(profile: "profile",name: "Sok"),
        StoryModel(profile: "profile",name: "Sok"),
        StoryModel(profile: "profile",name: "Sok"),
        StoryModel(profile: "profile",name: "Sok"),
        StoryModel(profile: "profile",name: "Sok"),
    ]
    
    public let profileImageView : UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}

extension StoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryPostCollectionViewCell", for: indexPath) as! StoryPostCollectionViewCell
            let storyPost = storyPosts[indexPath.row]
            cell.userProfileImageView.image = UIImage(named: storyPost.userProfile)
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
        let story = stories[indexPath.row]
        cell.profileImageView.image = UIImage(named: story.profile)
        cell.userNameLabel.text = story.name
        return cell
    }
    
}

class StoryPostCollectionViewCell : UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system) // Use .system for a UIButton with default styling
        let image = UIImage(systemName: "plus.circle.fill") // Use SF Symbols for the plus.circle icon
        
        button.setImage(image, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 13
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        button.tintColor = .systemBlue // Set the tint color of the button
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let userProfileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 40
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let yourStoryLable : UILabel = {
        let label = UILabel()
        label.text = "Your Story"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public func setupView() {
        contentView.addSubview(userProfileImageView)
        contentView.addSubview(plusButton) // Add plusButton as a subview of userProfileImageView
        contentView.addSubview(yourStoryLable)

        NSLayoutConstraint.activate([
            // Constraints for userProfileImageView
            userProfileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            userProfileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 80),
            userProfileImageView.widthAnchor.constraint(equalToConstant: 80),
            
            // Constraints for plusButton
            plusButton.centerXAnchor.constraint(equalTo: userProfileImageView.centerXAnchor,constant: 30),
            plusButton.centerYAnchor.constraint(equalTo: userProfileImageView.centerYAnchor, constant: 30),  plusButton.heightAnchor.constraint(equalToConstant: 26),  // Adjust the size as needed
            plusButton.widthAnchor.constraint(equalToConstant: 26),   // Adjust the size as needed
            
            yourStoryLable.topAnchor.constraint(equalTo: userProfileImageView.bottomAnchor, constant: 1),
            yourStoryLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25)
        ])
    }
}

class StoryCollectionViewCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.green.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public let userNameLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupView(){
        contentView.addSubview(profileImageView)
        contentView.addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            profileImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 35),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            
            userNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 5),
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}
