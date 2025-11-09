//
//  AtlysCustomCollectionView.swift
//  AtlysHomePageDesign
//
//  Created by varender singh on 09/11/25.
//

import Foundation
import UIKit
import SwiftUI

class AtlysCustomCollectionView: UIView, UICollectionViewDelegate,UICollectionViewDataSource {
    
    private var pageControl: UIPageControl!
    var cards: [CountryCard]!
    var collectionView:UICollectionView!
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        let layout = CenterScalingFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CountryCardCell.self, forCellWithReuseIdentifier: CountryCardCell.identifier)
        self.addSubview(collectionView)
        NSLayoutConstraint.activate([
                    collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
                    collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                    collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                    collectionView.heightAnchor.constraint(equalToConstant: 250)
                ])
        setupPageControl()
    }
    
    private func setupPageControl() {
            pageControl = UIPageControl()
            pageControl.translatesAutoresizingMaskIntoConstraints = false
            pageControl.currentPageIndicatorTintColor = .black
            pageControl.pageIndicatorTintColor = .gray.withAlphaComponent(0.3)
            pageControl.hidesForSinglePage = true
            
            addSubview(pageControl)
            
            NSLayoutConstraint.activate([
                pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0),
                pageControl.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        }
    
    func addAllCells(cards: [CountryCard]) {
        self.cards = cards
        pageControl.numberOfPages = cards.count
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CountryCardCell.identifier, for: indexPath) as? CountryCardCell else {
            return UICollectionViewCell()
        }
        let card = cards[indexPath.item]
        cell.configure(with: card.name, subtitle: card.subtitle, image: UIImage(named: card.imageName)!)
        cell.layer.cornerRadius = 12
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
          updateCurrentPage(scrollView)
      }
      
      func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
          if !decelerate {
              updateCurrentPage(scrollView)
          }
      }
      
      private func updateCurrentPage(_ scrollView: UIScrollView) {
          let centerX = scrollView.contentOffset.x + (scrollView.frame.size.width / 2)
          if let indexPath = collectionView.indexPathForItem(at: CGPoint(x: centerX, y: scrollView.frame.size.height / 2)) { pageControl.currentPage = indexPath.item
          }
      }
    
}

struct AtlysCarousalSwiftUIView: UIViewRepresentable {
    
    var data:[CountryCard]
    
    func makeUIView(context: Context) -> some UIView {
        let cellView = AtlysCustomCollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
        cellView.addAllCells(cards: data)
        return cellView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}
