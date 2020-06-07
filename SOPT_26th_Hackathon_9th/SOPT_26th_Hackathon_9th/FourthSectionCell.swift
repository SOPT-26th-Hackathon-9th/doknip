//
//  FourthSectionCell.swift
//  CollectionViewInCVPractice
//
//  Created by 송지훈 on 2020/05/29.
//  Copyright © 2020 soogoon. All rights reserved.
//

import UIKit
import Kingfisher






class FourthSectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
        let colors: [UIColor] = [.black, .darkGray, .gray, .lightGray, .magenta, .cyan, .yellow]
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            collectionView.delegate = self
            collectionView.dataSource = self
            
            
        }
        
    }

    extension FourthSectionCell: UICollectionViewDataSource {
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FourthSectionContentCell", for: indexPath) as! FourthSectionContentCell
            
                    
                    let url1:String = "https://post-phinf.pstatic.net/MjAxOTA5MjNfMTkz/MDAxNTY5MjAwNzQ0NjQ0.kdw9-CniIhgEAauuDCZPBDdDnRu9Jxip7qaygfCzurgg.5sxKdLn39pIAXOmtyAo8gGAo1LNRzU2wX1yFZrLIyeYg.JPEG/%EC%82%AC%EC%A7%841.jpg?type=w1200"
                    
                    let url2:String = "https://c-sf.smule.com/sf/s40/arr/25/4c/9f9fddae-fcd4-4d83-b766-5fb7d4e95f6f_512.jpg"
                    let url3:String = "https://post-phinf.pstatic.net/MjAxOTA5MjNfMTkz/MDAxNTY5MjAwNzQ0NjQ0.kdw9-CniIhgEAauuDCZPBDdDnRu9Jxip7qaygfCzurgg.5sxKdLn39pIAXOmtyAo8gGAo1LNRzU2wX1yFZrLIyeYg.JPEG/%EC%82%AC%EC%A7%841.jpg?type=w1200"
                    let url4:String = "https://upload.wikimedia.org/wikipedia/ko/c/c8/%EB%B2%8C%EC%83%88_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg"
            //        imgView.setImage(from:url)
                    
                    

                    
                    let urls : [String?] = [url4,url1,url2,url4]
                    cell.imageView.setImage(from: urls[indexPath.row]!)
            //        cell.imageView.image = images[indexPath.row]
                    
                    return cell
                }
                
        
        
    }

    extension FourthSectionCell: UICollectionViewDelegateFlowLayout {
        
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
        } // 전체 콜렉션 뷰에 대한 좌우상하 마진조정    }


}
