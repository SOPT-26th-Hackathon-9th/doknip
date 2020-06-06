//
//  SecondSectionCell.swift
//  CollectionViewInCVPractice
//
//  Created by elesahich on 2019/12/24.
//  Copyright © 2019 elesahich. All rights reserved.
//

import UIKit

class SecondSectionCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let colors: [UIColor] = [.black, .darkGray, .gray, .lightGray, .magenta, .cyan, .yellow]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
    
}

extension SecondSectionCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondSectionContentCell", for: indexPath) as! SecondSectionContentCell
        
        
        let img1 = UIImage(named: "secondSectionImg1")
        let img2 = UIImage(named: "secondSectionImg2")
        
        let images : [UIImage?] = [img1,img2,img1,img2]
        cell.imageView.image = images[indexPath.row]
        
        return cell
    }
    
    
}

extension SecondSectionCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = self.bounds.height - 20
        let width = height * (114 / 180)
        
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
