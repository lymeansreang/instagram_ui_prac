//
//  HomeTableViewCell.swift
//  InstagramTablePractice
//
//  Created by Rithiya on 23/8/24.
//

import UIKit

class HomeViewCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return "\(self)"
    }
    
    public let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public let userNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let postImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public let threeDotButton : UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "ellipsis")
        button.setImage(image, for: .normal)
        button.tintColor = .systemGray
        button.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let likeButtonImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "heart")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public let commentButtonImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chat")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public let shareButtonImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "send")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public let saveButtonImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bookmark")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .monospacedSystemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
        }()
    
    
//    public lazy var likeButton = initButton(icon: "heart" , title: "200k")
//    public lazy var commentButton = initButton(icon: "chat" , title: "168")
//    public lazy var shareButton = initButton(icon: "send" , title: "999")
    
    var contentStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initButton(icon: String, title: String) -> SocialButton{
        let button = SocialButton()
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(named: icon), for: .normal)
        button.setTitle(title, for: .normal)
        button.textSize = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    public func setupView(){
        contentView.addSubview(profileImageView)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(threeDotButton)
        contentView.addSubview(likeButtonImageView)
        contentView.addSubview(commentButtonImageView)
        contentView.addSubview(shareButtonImageView)
        contentView.addSubview(saveButtonImageView)
        contentView.addSubview(descriptionLabel)
        
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            
            userNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35),
            
            postImageView.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 15),
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -70),
            
            threeDotButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            threeDotButton.bottomAnchor.constraint(equalTo: postImageView.topAnchor, constant: -20),
            
            likeButtonImageView.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
            likeButtonImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            likeButtonImageView.heightAnchor.constraint(equalToConstant: 20),
            likeButtonImageView.widthAnchor.constraint(equalToConstant: 20),
            
            commentButtonImageView.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
            commentButtonImageView.leadingAnchor.constraint(equalTo: likeButtonImageView.trailingAnchor, constant: 30),
            commentButtonImageView.heightAnchor.constraint(equalToConstant: 20),
            commentButtonImageView.widthAnchor.constraint(equalToConstant: 20),
            
            shareButtonImageView.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
            shareButtonImageView.leadingAnchor.constraint(equalTo: commentButtonImageView.trailingAnchor, constant: 30),
            shareButtonImageView.heightAnchor.constraint(equalToConstant: 20),
            shareButtonImageView.widthAnchor.constraint(equalToConstant: 20),
            
            saveButtonImageView.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
            saveButtonImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            saveButtonImageView.heightAnchor.constraint(equalToConstant: 20),
            saveButtonImageView.widthAnchor.constraint(equalToConstant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

class SocialButton: UIButton {
    var titleFont: UIFont! = nil
    var textSize: CGFloat = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleFont = titleLabel?.font ?? .none
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.titleFont = titleLabel?.font ?? .none
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: textSize + 10, height: 30)
        //why height is 30? You want your imageView to be of height 25 and want top and bottom insets to be 5 each so 25 + 5 + 5 = 30
        //Why textSize + 40? You want your button to take appropriate size of text + 5 left inset of image + 25 of imageView + 5 left inset of title + 5 right inset of title
    }

    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 9, y: 8, width: 25, height: 25)
        //why x is 5 because you want your image to have left inset of 5
        //why y is 2.5 ? Your button height is 30, image height is 25 so (30 - 25) / 2 = 2.5
    }

    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        if let string = self.title(for: .normal) {
            textSize = string.widthOfString(usingFont: titleLabel!.font)
            return CGRect(origin: CGPoint(x: 35, y: 0), size: CGSize(width: textSize + 10, height: 40))
            //same explanation why x is 35 ? 5 (left inset of image) + 25 (image width) + 5 (left inset of text) = 35
        }
        return CGRect.zero
    }
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
