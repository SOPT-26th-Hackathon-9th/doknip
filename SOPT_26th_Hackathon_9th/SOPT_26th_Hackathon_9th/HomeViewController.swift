//
//  ViewController.swift
//  CollectionViewInCVPractice
//
//  Created by elesahich on 2019/12/23.
//  Copyright © 2019 elesahich. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  @IBOutlet weak var collectionView: UICollectionView!

    
    
    
    
    override func viewDidLoad() {
    super.viewDidLoad()

    
    
    
    setNavigationBar()
    collectionView.delegate = self
    collectionView.dataSource = self

  }
    
    
    func setNavigationBar(){
        
        let logoImage = UIImage(named: "homeBtnLogo")
        let menuImage = UIImage(named: "homeBtnMenu")
        let searchImage = UIImage(named: "homeBtnSearch")
        
        
        self.navigationItem.titleView = UIImageView(image: logoImage)    // 로고 이미지 정하기
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuImage, style:.plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: searchImage, style:.plain, target: nil, action: nil)

        self.navigationController?.navigationBar.barTintColor = UIColor.white // 네비게이션 바 색상 흰색으로 바꾸기
        self.navigationController?.navigationBar.shadowImage = UIImage() // 네비게이션 바 구분 선 지우기

        
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
        

    
      func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
      }
        
      
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
          return 1
        } else if section == 1 {
          return 1
        } else {
          return 1
        }
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
          case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondSectionCell", for: indexPath) as! SecondSectionCell
            return cell
            
          case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdSectionCell", for: indexPath) as! ThirdSectionCell
            return cell
        
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FourthSectionCell", for: indexPath) as! FourthSectionCell
    
            return cell
            

            
          default:
            assert(false, "Invalid element type")
        }
      }
      
      func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
          case UICollectionView.elementKindSectionHeader:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderReusableView", for: indexPath) as! HeaderReusableView
            
            if indexPath.section == 0
            {
                view.headerTItle.text = "내가 찜한 영화"
                view.headerMenu1.setTitle("", for: .normal)
                view.headerMenu2.setTitle("", for: .normal)
                view.headerMenu3.setTitle("", for: .normal)
            }
            else if indexPath.section == 1
            {
                
                view.headerTItle.text = "상영 예정 영화"
                
                view.headerMenu1.setTitle("", for: .normal)
                view.headerMenu2.setTitle("", for: .normal)
                view.headerMenu3.setTitle("", for: .normal)

            }
            
            else if indexPath.section == 2
            {
                view.headerTItle.text = "상영 중인 영화"
                
                view.headerMenu1.setTitle("", for: .normal)
                view.headerMenu2.setTitle("", for: .normal)
                view.headerMenu3.setTitle("", for: .normal)
            }

            
            return view
          default:
            assert(false, "Invalid element type")
        }
      }
    }

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if indexPath.section == 0 {
            let width = self.view.bounds.width
            let height = self.view.bounds.width * (114 / 180)
            return CGSize(width: width, height: height.rounded())
            
        }else if indexPath.section == 1{
            
            let width = self.view.bounds.width
            let height = self.view.bounds.width * (114 / 180)
            return CGSize(width: width, height: height.rounded())
        }
            else if indexPath.section == 2 {
                let width = self.view.bounds.width
                let height = self.view.bounds.width * (114 / 180)
                return CGSize(width: width, height: height.rounded())
                
            }

            
            
        else {
            let width = (self.view.bounds.width - 55) / 2
            let divisor = pow(10.0, CGFloat(1))
            let roundedWidth = (width * divisor).rounded() / divisor
            let roundedHeight = roundedWidth * (208 / 160)
            return CGSize(width: roundedWidth, height: roundedHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 || section == 1 {
            return 0
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { // 섹션내 collectionview 간격 조정
        if section == 0 || section == 1 {
            return 0
        } else {
            return 12
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // 여기서 inset 설정하기
            
        } else if section == 1 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else if section == 2 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else if section == 3 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else if section == 4 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
            
        else {
            return UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20)
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        
        
        if section == 0{
            return CGSize(width: self.view.bounds.width, height: 45)
        } else if section == 1 {
            
            
            return CGSize(width: self.view.bounds.width, height: 45)
        }else if section == 2 {
            
            
            return CGSize(width: self.view.bounds.width, height: 45)
        }
            
            
            
            
        else{
            return CGSize(width: self.view.bounds.width, height: 45)
        }
    }
}



