//
//  FirstSectionCell.swift
//  CollectionViewInCVPractice
//
//  Created by elesahich on 2019/12/24.
//  Copyright © 2019 elesahich. All rights reserved.
//

import UIKit

class FirstSectionCell: UICollectionViewCell {
    
  var data: [String] = []
  
  let colors: [UIColor] = [.brown, .cyan, .green]
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    collectionView.delegate = self
    collectionView.dataSource = self
  }
}

extension FirstSectionCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstSectionContentCell", for: indexPath) as! FirstSectionContentCell
    
    
    let firstsectionImage = UIImage(named: "homeSliderAd")    // 사진 넣는 부분 수정해야 함
   
    cell.imageView.image = firstsectionImage
    
    
    
    
    return cell
  }
    
    
}

extension FirstSectionCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    

    
    return CGSize(width: self.bounds.width, height: self.bounds.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
    
    
}
