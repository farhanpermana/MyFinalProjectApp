//
//  NonScrollableCollectionView.swift
//  FinalProject
//
//  Created by Farhan Permana on 12/04/23.
//

import UIKit

class NonScrollingCollectionView: UICollectionView {
    override var contentOffset: CGPoint {
        didSet {
            // Override the contentOffset property to always be zero
            super.contentOffset = .zero
        }
    }
}
