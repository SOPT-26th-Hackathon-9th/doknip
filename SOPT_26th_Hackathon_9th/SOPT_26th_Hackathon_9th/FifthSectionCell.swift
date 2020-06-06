//
//  FifthSectionCell.swift
//  CollectionViewInCVPractice
//
//  Created by 송지훈 on 2020/05/29.
//  Copyright © 2020 soogoon. All rights reserved.
//

import UIKit

class FifthSectionCell: UICollectionViewCell {


@IBOutlet weak var collectionView: UICollectionView!


    let colors: [UIColor] = [.black, .darkGray, .gray, .lightGray, .magenta, .cyan, .yellow]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
    
}

extension FifthSectionCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FifthSectionContentCell", for: indexPath) as! FifthSectionContentCell
        
        
        let img1 = UIImage(named: "fifthSectionImg1")

        
        let images : [UIImage?] = [img1,img1,img1,img1]
        cell.imageView.image = images[indexPath.row]
        
        return cell
    }
    
    
}

extension FifthSectionCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = self.bounds.height - 20
        let width = height * (275 / height)
        
        return CGSize(width: width.rounded(), height: height.rounded())
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: -10, left: 16, bottom: 10, right: CGFloat(16 + (colors.count - 1) * 10))
    } // 전체 콜렉션 뷰에 대한 좌우상하 마진조정
}

