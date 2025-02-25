

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var BannerPageController: UIPageControl!
    @IBOutlet weak var BannerScrollView: UIScrollView!
    
    @IBAction func goBack(_ sender: Any) {
    }
    @IBAction func searchButton(_ sender: Any) {
    }
    @IBAction func myPageButton(_ sender: Any) {
    }
    
    func Banner(imageURL:[String]){
        for index in 0..<imageURL.count {
            let subView = UIImageView()
            subView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width * (204/375))
            subView.frame.origin.x = self.view.frame.width * CGFloat(index)
            subView.backgroundColor = UIColor.blue
            subView.image = UIImage(named: imageURL[index])
            subView.contentMode = UIView.ContentMode.scaleToFill
            BannerScrollView.addSubview(subView)
            //subView.layer.borderWidth = 2
            print(subView.frame)
        }
        // scrollView에서 페이징이 가능하도록 설정
        BannerScrollView.isPagingEnabled = true
        // scrollView의 contentSize를 5 페이지 만큼으로 설정
        BannerScrollView.contentSize = CGSize(
            width: self.view.frame.width *
                CGFloat(imageURL.count),
            height:self.view.frame.width * (204/375)
        )
        BannerScrollView.alwaysBounceVertical = false // 수직 스크롤 바운스 안되게 설정
        BannerPageController.numberOfPages = imageURL.count
        BannerScrollView.delegate = self
        BannerScrollView.tag = 4
        self.view.bringSubviewToFront(BannerPageController)
    }
    
    
    @IBOutlet weak var ActorCollectionView: UICollectionView!
    @IBOutlet weak var RecommendCollectionView: UICollectionView!
    func setActorView(){
        ActorCollectionView.delegate = self
        ActorCollectionView.dataSource = self
        ActorCollectionView.tag = 1
    }
    func setRecommentView(){
        RecommendCollectionView.delegate=self
        RecommendCollectionView.dataSource=self
        RecommendCollectionView.tag = 2
    }
    
    @IBOutlet weak var movieDurationLabel: UILabel!
    @IBOutlet weak var movieTimeLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    func setmovieIfo(date:String,time:String,story:String){
        movieDurationLabel.text=date
        movieTimeLabel.text = time
        storyLabel.text = story
    }
    
    @IBOutlet weak var buttonUI: UIButton!
    func grad(){
        let gradient = CAGradientLayer()
        gradient.frame = buttonUI.frame
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint   = CGPoint(x: gradient.frame.width, y: gradient.frame.height)
        gradient.locations  = [0, 0.65, 1]
        gradient.colors =
        [UIColor(red: 55.0 / 255.0, green: 70.0 / 255.0, blue: 250.0 / 255.0, alpha: 1.0).cgColor,
         UIColor(red: 193.0 / 255.0, green: 56.0 / 255.0, blue: 56.0 / 255.0, alpha: 1.0).cgColor]
        
        gradient.shouldRasterize = true
        buttonUI.layer.addSublayer(gradient)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        grad()
        let bannerImageName:[String] = ["7","8"]
        //let temp:[URL] = [URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSBfOQPXQAE9iuYAB_qcKG_hmKn5LY_dzoE0oe8Wx2k7m6hcs2P&usqp=CAU")!,URL(string: "https://res.heraldm.com/phpwas/restmb_idxmake.php?idx=507&simg=/content/image/2019/11/02/20191102000070_0.jpg")!]
        Banner(imageURL: bannerImageName)
        setmovieIfo(date: "2020년 06월 07일 (일)", time: "16:00 ~ 18:00 (2시간)", story:"그 여름, 나에게도 친구가 생겼다. “내 마음이 들리니 ”외톨이 영훈은 방학식 날, 전학생 지아를 만나 서로의 비밀을 나누며 순식")
        
        setActorView()
        setRecommentView()
        // Do any additional setup after loading the view.
        
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    private var characterImage:[String] = ["movieImgRole1","movieImgRole2","movieImgRole3","movieImgRole4","movieImgRole5"]
    private var movieRecom:[String] = ["movieRecom1","movieRecom2","movieRecom3"]

}
extension SecondViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return characterImage.count
        }
        return movieRecom.count
    }
}

extension SecondViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
        let cell:ActorCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ActorCollectionViewCell.identifier, for: indexPath) as! ActorCollectionViewCell
            cell.actorImg.image = UIImage(named: characterImage[indexPath.row])
            /*cell.actorImg.setImage(path: URL(string: "https://littledeep.com/wp-content/uploads/2020/02/littledeep_monkey_style1.png")!)*/
        cell.actorName.text = "이이이"
        cell.actorRoll.text = "아아아"
            //cell.backgroundColor = UIColor.black
            //cell.actorImg.layer.cornerRadius = cell.actorImg.frame.height/2
            //cell.actorImg.layer.borderWidth = 1
            // 뷰의 경계에 맞춰준다
            //cell.actorImg.clipsToBounds = true
        return cell
        }
        else {
            let cell:RecommendCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as! RecommendCollectionViewCell
            //cell.MovieImg.setImage(path: URL(string: "https://littledeep.com/wp-content/uploads/2020/02/littledeep_monkey_style1.png")!)
            //cell.MovieImg.layer.borderWidth = 1
            cell.MovieImg.image = UIImage(named: movieRecom[indexPath.row])
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print(indexPath)
        if collectionView.tag == 1 {
            
        }
    }
}
extension SecondViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView.tag == 1 {
            return UIEdgeInsets(top: 0, left: 8,bottom: 0, right: 8)
        }
        else if collectionView.tag == 2 {
                   return UIEdgeInsets(top: 0, left: 25,bottom: 0, right: 25)
               }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 1 {return 10}
        else {return 10}
    }
}
extension SecondViewController: UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if(scrollView.tag == 4){
        scrollView.bringSubviewToFront(BannerPageController)
        BannerPageController.currentPage = Int(floor(scrollView.contentOffset.x / self.view.frame.width))
        }
    }
}
extension UIImageView {
    func setImage(path:URL) {
       let url = path
        DispatchQueue.global(qos: .background).async {
            guard let data:Data = try? Data(contentsOf: url) , let image:UIImage = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
