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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
//        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        
        NSLayoutConstraint.activate([
            
        ])
    }
}
