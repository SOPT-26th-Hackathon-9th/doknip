//
//  ThirdSectionCell.swift
//  CollectionViewInCVPractice
//
//  Created by elesahich on 2019/12/24.
//  Copyright © 2019 elesahich. All rights reserved.
//

import UIKit

class ThirdSectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    let colors: [UIColor] = [.black, .darkGray, .gray, .lightGray, .magenta, .cyan, .yellow]
    
        override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
}


extension ThirdSectionCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
        
    }
    
    

    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdSectionContentCell", for: indexPath) as! ThirdSectionContentCell
        
        
        let img1 = UIImage(named: "categoryImg1")
        let img2 = UIImage(named: "categoryImg2")
        let img3 = UIImage(named: "categoryImg3")
        
        let images : [UIImage?] = [img1,img2,img3,img1,img2,img3,img1,img2,img3]
        cell.imageView.image = images[indexPath.row]    
        
        return cell

    }
    
}

extension ThirdSectionCell: UICollectionViewDelegateFlowLayout{
    

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
    }
    
    
}
