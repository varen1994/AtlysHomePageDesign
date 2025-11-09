//
//  CustomFlowLayout.swift
//  AtlysHomePageDesign
//
//  Created by varender singh on 09/11/25.
//

import UIKit
import Foundation

class CenterScalingFlowLayout: UICollectionViewFlowLayout {
    let activeDistance: CGFloat = 200     // distance within which scaling applies
    let zoomFactor: CGFloat = 0.25        // scale amount for the center cell

    override init() {
        super.init()
        scrollDirection = .horizontal
        minimumLineSpacing = 10
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        let inset = (collectionView.bounds.width - itemSize.width) / 2
        sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }

    // Scale cells based on distance from center
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect),
              let collectionView = collectionView else { return nil }

        let centerX = collectionView.contentOffset.x + collectionView.bounds.size.width / 2
        var maxZoom: CGFloat = 0
        var centerMostAttr: UICollectionViewLayoutAttributes?

        // First pass: Apply scaling and find the center-most cell
        for attr in attributes {
            let distance = abs(attr.center.x - centerX)
            let normalized = distance / activeDistance
            let zoom = 1 + zoomFactor * (1 - min(1, normalized))
            attr.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0)
            
            // Track the cell with the highest zoom (closest to center)
            if zoom > maxZoom {
                maxZoom = zoom
                centerMostAttr = attr
            }
        }

        // Second pass: Assign zIndex to ensure center-most cell is on top
        for attr in attributes {
            if attr == centerMostAttr {
                attr.zIndex = 1000 // Highest zIndex for the center-most cell
            } else {
                let distance = abs(attr.center.x - centerX)
                let normalized = distance / activeDistance
                let zoom = 1 + zoomFactor * (1 - min(1, normalized))
                attr.zIndex = Int((1 - normalized) * 500) // Lower zIndex for non-center cells
            }
        }

        return attributes
    }

    // Invalidate layout while scrolling
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    // Snap behavior
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint)
    -> CGPoint {
        guard let collectionView = collectionView else { return proposedContentOffset }
        let collectionViewCenter = collectionView.bounds.size.width / 2
        let proposedCenterX = proposedContentOffset.x + collectionViewCenter
        guard let layoutAttributes = layoutAttributesForElements(in: collectionView.bounds) else {
            return proposedContentOffset
        }

        var closest: UICollectionViewLayoutAttributes?
        var minDistance = CGFloat.greatestFiniteMagnitude
        for attr in layoutAttributes {
            let distance = attr.center.x - proposedCenterX
            if abs(distance) < abs(minDistance) {
                minDistance = distance
                closest = attr
            }
        }

        guard let closestAttr = closest else { return proposedContentOffset }
        let targetOffsetX = proposedContentOffset.x + minDistance
        return CGPoint(x: targetOffsetX, y: proposedContentOffset.y)
    }
}
