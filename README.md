

# 솝커톤 : 대한독립영화만세 iOS 클라이언트 파트

 
### 🔥참여 인원 🔥
|    이름  |    파트   |      |
| ----    | ---- | ---- |
|    송지훈  |    26기 YB/iOS  |      |
|    김태훈  |   26기 YB/iOS   |      |
|     노한솔 |   26기 YB/iOS   |      |
 

[이동하기](https://github.com/SOPT-26th-Hackathon-9th/doknip)
___
- 사용 개념 : Cocoapods 연동, Alamofire HTTP 통신 / Kingfisher 을 이용한 이미지 캐싱



___



#### Kingfisher 로 이미지 가져오기

```Swift

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
```


### 스토리보드 구조

<img width="320" alt="스크린샷 2020-06-07 오전 8 39 51" src="https://user-images.githubusercontent.com/60260284/83956568-76377f80-a89a-11ea-85fa-d819f16a7fed.png">
(결과물)


<img width="1017" alt="스크린샷 2020-06-07 오전 8 38 49" src="https://user-images.githubusercontent.com/60260284/83956552-5011df80-a89a-11ea-886f-d782b0ef42ae.png">

<br>

다음과 같이 카테고리 별 제목이 들어가는 부분을 <code> ReusableHeader </code> 형태를 활용해서 
구현했다.


```Swift
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

```
<code> UICollectionReusableView </code> 를 활용해 이 함수 내에서 
ReusuableHeader IBOutlet 텍스트를 섹션별로 따로 지정해주었다.




___

##  다른 스토리 보드내 ViewController 호출하기

```Swift
let tabStoryBoard = UIStoryboard(name: "TableView", bundle: nil)
```
우선 다른 스토리보드를 name을 통해 정의한다.

![스크린샷 2020-05-22 오후 4 03 36](https://user-images.githubusercontent.com/60260284/82640587-d21cca00-9c45-11ea-9af7-b5173b768993.png)
<br>
여기서의 name 은 스토리보드 파일 이름을 사용 한다!


```Swift
             guard let tabbarController = tabStoryBoard.instantiateViewController(identifier:
                   "tabBarStoryBoard") as? UITabBarController else { return }

             tabbarController.modalPresentationStyle = .fullScreen
             self.present(tabbarController, animated: true, completion: nil)
```

![스크린샷 2020-05-22 오후 4 05 58](https://user-images.githubusercontent.com/60260284/82640780-245deb00-9c46-11ea-8226-f0c5db16cc0c.png)

여기에 있는 Storyboard Id를 identifier에 넣어서 표시하고자 하는 Viewcontroller 와 연결 시켜 준다.
이후에 .fullScreen 으로 modal style을 정해주고 Present 해준다.


___


### 각 컬렉션 뷰에서 셀 크기 조정해주기


```Swift
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
```
