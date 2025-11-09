//
//  CountryCardCell.swift
//  AtlysHomePageDesign
//
//  Created by varender singh on 09/11/25.
//

import Foundation
import UIKit

class CountryCardCell: UICollectionViewCell {
    
    static let identifier = "CountryCardCell"
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .white
        label.backgroundColor = UIColor.purple.withAlphaComponent(0.9)
        label.layer.cornerRadius = 6
        label.layer.masksToBounds = true
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -4),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 22),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with country: String, subtitle: String, image: UIImage) {
        titleLabel.text = country
        subtitleLabel.text = "  \(subtitle)  "
        backgroundImageView.image = image
    }
}
