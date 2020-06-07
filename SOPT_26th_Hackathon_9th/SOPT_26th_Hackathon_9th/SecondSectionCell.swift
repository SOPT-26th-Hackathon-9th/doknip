//
//  SecondSectionCell.swift
//  CollectionViewInCVPractice
//
//  Created by elesahich on 2019/12/24.
//  Copyright © 2019 elesahich. All rights reserved.
//

import UIKit
import Kingfisher




extension UIImageView {
    func setImage(from url: String) {                           // 이 기본 함수에 대해서 kingfisher 를 이용해 커스텀 할 예정
        
        // URL이 들어오는 것을 Cache 키로 사용
        let cache = ImageCache.default
        cache.removeImage(forKey: url)                          // 이거 없어도 기본적 동작은 가능함
        self.kf.indicatorType = .activity                       // 그 이미지 다운로드 하고 있다는 걸 나타내기 위해 indicator (동그라미 돌아가는거) 표시
        cache.retrieveImage(forKey: url) { result in
            switch result {                                     // 저번 로그인 및 회원 가입
                                                                // 캐시에 이미지가 있는 경우
            case .success(let value):                           // 성공했을때?
                switch value.cacheType {
                                                            // setImage을 호출 시, 자동으로 캐시에 저장하고 호출함
                case .none: self.kf.setImage(with: URL(string: url)!, placeholder: UIImage(systemName: "pencil"), options: [.transition(.fade(1))])
                // 이미지 업로드 성공했을때 1초 fade 효과 넣어주고, 로딩하는 동안  pencil 이미지로 placeholder 를 달아줌
                case .memory: self.image = value.image
                case .disk: self.image = value.image
                }
            case .failure(let error):           // 만약 해당 url에 사진 불러오는 걸 실패한다면,
                print(error.errorCode) // 에러 코드 출력하고
                self.image = UIImage()
            }
        }
    }
}

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
        
        
        
        let url1:String = "https://post-phinf.pstatic.net/MjAxOTA5MjNfMTkz/MDAxNTY5MjAwNzQ0NjQ0.kdw9-CniIhgEAauuDCZPBDdDnRu9Jxip7qaygfCzurgg.5sxKdLn39pIAXOmtyAo8gGAo1LNRzU2wX1yFZrLIyeYg.JPEG/%EC%82%AC%EC%A7%841.jpg?type=w1200"
        
        let url2:String = "https://c-sf.smule.com/sf/s40/arr/25/4c/9f9fddae-fcd4-4d83-b766-5fb7d4e95f6f_512.jpg"
        let url3:String = "https://post-phinf.pstatic.net/MjAxOTA5MjNfMTkz/MDAxNTY5MjAwNzQ0NjQ0.kdw9-CniIhgEAauuDCZPBDdDnRu9Jxip7qaygfCzurgg.5sxKdLn39pIAXOmtyAo8gGAo1LNRzU2wX1yFZrLIyeYg.JPEG/%EC%82%AC%EC%A7%841.jpg?type=w1200"
        let url4:String = "https://upload.wikimedia.org/wikipedia/ko/c/c8/%EB%B2%8C%EC%83%88_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg"
//        imgView.setImage(from:url)
        
        

        
        let urls : [String?] = [url4,url1,url2,url3]
        cell.imageView.setImage(from: urls[indexPath.row]!)
//        cell.imageView.image = images[indexPath.row]
        
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
