//  메인 뷰 컨트롤러.
//  ViewController.swift
//  GooglePlayBook_PreProject
//
//  Created by 김소영 on 2023/02/08.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 네비게이션
    private var navigationBarView: UIView = UIView()
    private var backButton: UIButton = UIButton()
    private var searchField: UITextField = UITextField()
    
    // 메뉴 탭
    private var menuBarView: UIView = UIView()
    private var selectBarView: UIView = UIView()
    private var lineView: UIView = UIView()
    let menuBarCollectionView:  UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // 처음 검색 string
    var baseSearchString = "Harry Potter"
    
    // 메뉴 탭 데이터
    private let menudata = MenuBarCollectionViewData.menuList
    var isEBook:Bool = true
    // book 데이터
    var bookInfo = [Book]()
    // youtube 데이터
    var videoInfo = [Youtube]()
    var videoid = [String]()
    
    var bookIndex = 0
    var videoIndex = 0
    
    // containerView
    private var containerView: UIView = UIView()
    
    let eBookCollectionView:  UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    //로딩
    let loading = LoadingIndicator.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkDeviceNetworkStatus()
        setNetwork(searchText: baseSearchString)
        
        setupNavigationBarLayout()
        configuereSearch()
        setupMenuBarLayout()
        setupMenuBarCollectionViewLayout()
        configureCollectionView()
        setFirstIndexIsSelected()
        setupcontainerViewLayout()
        setupeBookCollectionViewLayout()
        
    }

    // 메인화면 구성 - 상단 네비게이션 바
    private func setupNavigationBarLayout() {
        
        // 메인 배경화면 컬러
        view.backgroundColor = UIColor(named: "mainBackgroundColor")
        
        // 네비게이션 뷰
        view.addSubview(navigationBarView)
        navigationBarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            navigationBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            navigationBarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navigationBarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            navigationBarView.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        navigationBarView.backgroundColor = .clear
        
        // 이전 버튼
        navigationBarView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: navigationBarView.topAnchor, constant: 0),
            backButton.bottomAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: 0),
            backButton.leadingAnchor.constraint(equalTo: navigationBarView.leadingAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 44),
        ])
        
        backButton.setImage(UIImage(named: "left_arrow.png"), for: .normal)
        backButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        backButton.backgroundColor = .clear
        
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
        // 검색 텍스트 필드
        navigationBarView.addSubview(searchField)
        searchField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: navigationBarView.topAnchor, constant: 0),
            searchField.bottomAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: 0),
            searchField.leadingAnchor.constraint(equalTo: backButton.trailingAnchor),
            searchField.trailingAnchor.constraint(equalTo: navigationBarView.trailingAnchor, constant: -10),
        ])
        
        searchField.backgroundColor = .clear
        searchField.attributedPlaceholder = NSAttributedString(
            string: "Play 북에서 검색",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "mainTextColor")!]
        )
        searchField.clearButtonMode = .whileEditing
        searchField.textColor = UIColor(named: "mainTextColor")
        
        // 키보드 리턴 키 변경
        searchField.returnKeyType = .search
    }
    
    // 메인화면 구성 - 메뉴 탭
    private func setupMenuBarLayout() {
        
        // 메뉴 바 뷰
        view.addSubview(menuBarView)
        menuBarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            menuBarView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: 0),
            menuBarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            menuBarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            menuBarView.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        menuBarView.backgroundColor = .clear
        
        // 메뉴바 하단 라인
        menuBarView.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lineView.bottomAnchor.constraint(equalTo: menuBarView.bottomAnchor, constant: 0),
            lineView.leadingAnchor.constraint(equalTo: menuBarView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: menuBarView.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
        ])
        
        lineView.backgroundColor = .gray
        
        // 메뉴 select Bar
        view.addSubview(selectBarView)
        selectBarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            selectBarView.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: 0),
            selectBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            selectBarView.heightAnchor.constraint(equalToConstant: 5),
            selectBarView.widthAnchor.constraint(equalToConstant: 50),
        ])
        
        selectBarView.backgroundColor = UIColor(named: "pointBlueColor")
        
        selectBarView.clipsToBounds = true
        selectBarView.layer.cornerRadius = 5
        selectBarView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
    }
    
    // 메인화면 구성 - 하단 컨테이너 뷰
    private func setupcontainerViewLayout() {
        
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: menuBarView.bottomAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
        
        containerView.backgroundColor = .clear
    }
    
    // action - back Button
    @objc func backButtonAction(sender: UIButton!) {
        // 이전 페이지가 없다 - 알럿
        let alert = UIAlertController(title: "알림", message: "이전 페이지가 없습니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
    }
    
    // 통신 - get BookInfo
    func setNetwork(searchText: String) {
        //로딩
        self.loading.showIndicator()
        
        var string = ""
        if searchText == "" {
            string = baseSearchString
        }else{
            string = searchText
        }
        
            if isEBook {
                // ebook 검색
                bookIndex = 0
                self.bookInfo.removeAll()
                EBookNetworkManager.shared.getEBookData(searchText: string, index: 0) { (response) in
                    switch response {
                    case .success(let data):
                        self.loading.hideIndicator()
                        if let decodedData = data as? ApiResponse {
                            self.bookInfo = decodedData.items
                            DispatchQueue.main.async {
                                // collectionview 제일 위로 이동
                                self.eBookCollectionView.scrollToItem(at: IndexPath(row: -1, section: 0), at: .top, animated: true)
                                self.eBookCollectionView.reloadData()
                            }
                            return
                        }
                    case .failure(let data):
                        print("Network fail", data)
                    }
                }
            }else{
                // video 검색
                videoIndex = 0
                self.videoInfo.removeAll()
                YouTubeNetworkManager.shared.getVideoData(searchText: string,index: 0) { (response) in
                    switch response {
                    case .success(let data):
                        self.loading.hideIndicator()
                        if let decodedData = data as? YouTubeApiResponse {
                            self.videoInfo = decodedData.items
                            DispatchQueue.main.async {
                                // collectionview 제일 위로 이동
                                self.eBookCollectionView.scrollToItem(at: IndexPath(row: -1, section: 0), at: .top, animated: true)
                                self.eBookCollectionView.reloadData()
                            }
                            return
                        }
                    case .failure(let data):
                        print("Network fail", data)
                }
            }
        }
    }
    
    // eBook 데이터 더 불러오기 - 20개
    func loadMoreBookData(index:Int) {
        let searchText = searchField.text
        var string = ""
        if searchText == "" {
            string = baseSearchString
        }else{
            string = searchText!
        }
        // ebook 검색
        EBookNetworkManager.shared.getEBookData(searchText: string, index: index) { (response) in
            switch response {
                case .success(let data):
                    if let decodedData = data as? ApiResponse {
                        self.bookInfo += decodedData.items
                        DispatchQueue.main.async {
                            self.eBookCollectionView.reloadData()
                        }
                        return
                    }
                case .failure(let data):
                    print("Network fail", data)
                }
            }
        }
    
    // video 데이터 더 불러오기 - 20개
    func loadMoreVideoData(index:Int) {
        let searchText = searchField.text
        var string = ""
        if searchText == "" {
            string = baseSearchString
        }else{
            string = searchText!
        }
        // video 검색
        YouTubeNetworkManager.shared.getVideoData(searchText: string,index: index) { (response) in
            switch response {
                case .success(let data):
                    if let decodedData = data as? YouTubeApiResponse {
                        self.videoInfo += decodedData.items
                        DispatchQueue.main.async {
                            self.eBookCollectionView.reloadData()
                        }
                        return
                    }
                case .failure(let data):
                    print("Network fail", data)
            }
        }
    }
    
    // 네트워크 연결 상태 확인
    func checkDeviceNetworkStatus() {
        if !(DeviceManager.shared.networkStatus) {
            let alert: UIAlertController = UIAlertController(title: "네트워크 상태 확인", message: "네트워크가 불안정 합니다.", preferredStyle: .alert)
            let action: UIAlertAction = UIAlertAction(title: "다시 시도", style: .default, handler: { (action) in
                self.checkDeviceNetworkStatus()
            })
            alert.addAction(action)
            present(alert,animated: true, completion: nil)
        }
    }
    
}
// collectionView
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 메뉴 바 - 0번째 Index로
    func setFirstIndexIsSelected() {
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        menuBarCollectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .bottom)
    }
    
    func configureCollectionView() {
        // 메뉴 바 collectionview
        menuBarCollectionView.register(MenuBarCollectionViewCell.self, forCellWithReuseIdentifier: MenuBarCollectionViewCell.id)
        menuBarCollectionView.delegate = self
        menuBarCollectionView.dataSource = self
        
        // eBook collectionView
        eBookCollectionView.register(EBookCollectionViewCell.self, forCellWithReuseIdentifier: EBookCollectionViewCell.id)
        eBookCollectionView.delegate = self
        eBookCollectionView.dataSource = self

        eBookCollectionView.showsHorizontalScrollIndicator = false
        
        // headerview
        eBookCollectionView.register(EBookCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: EBookCollectionReusableView.id)
        
    }
    
    // 메뉴 바 collectionview layout
    func setupMenuBarCollectionViewLayout() {
        menuBarView.addSubview(menuBarCollectionView)

        menuBarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            menuBarCollectionView.topAnchor.constraint(equalTo: menuBarView.topAnchor, constant: 0),
            menuBarCollectionView.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: 0),
            menuBarCollectionView.leadingAnchor.constraint(equalTo: menuBarView.leadingAnchor),
            menuBarCollectionView.trailingAnchor.constraint(equalTo: menuBarView.trailingAnchor),
        ])
    }
    
    // eBook collectionview layout
    func setupeBookCollectionViewLayout() {
        containerView.addSubview(eBookCollectionView)

        eBookCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eBookCollectionView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            eBookCollectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            eBookCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            eBookCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }
    
    // collectionView cell count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == menuBarCollectionView){
            return menudata.count
        }else{
            if isEBook {
                return self.bookInfo.count
            }else{
                return self.videoInfo.count
            }
        }
    }
    
    // collectionView cell UI
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == menuBarCollectionView){
            let cell = menuBarCollectionView.dequeueReusableCell(withReuseIdentifier: MenuBarCollectionViewCell.id, for: indexPath) as! MenuBarCollectionViewCell
        
            cell.menuTitle.text = menudata[indexPath.item]
        
            return cell
        }else{
            let cell = eBookCollectionView.dequeueReusableCell(withReuseIdentifier: EBookCollectionViewCell.id, for: indexPath) as! EBookCollectionViewCell
            
            if isEBook {
                //eBook 데이터
                
                // 책제목
                cell.eBookTitleLabel.text = self.bookInfo[indexPath.row].volumeInfo.title
                // 작가
                let authors = self.bookInfo[indexPath.row].volumeInfo.authors ?? ["..."]
                var author = ""
                
                for j in authors {
                    author += "\(j) "
                }
                cell.eBookAuthorsLabel.text = author
                
                // 책 이미지
                let thumbnailImg = self.bookInfo[indexPath.row].volumeInfo.imageLinks?.thumbnail
                let smallImg = self.bookInfo[indexPath.row].volumeInfo.imageLinks?.smallThumbnail
                if thumbnailImg != nil {
                    cell.eBookThumbnailImageView.load(urlString: thumbnailImg!)
                    cell.eBookThumbnailImageView.contentMode = .scaleAspectFill
                }else {
                    if smallImg != nil {
                        cell.eBookThumbnailImageView.load(urlString: smallImg!)
                        cell.eBookThumbnailImageView.contentMode = .scaleAspectFill
                    }else{
                        cell.eBookThumbnailImageView.image = UIImage(named: "noimage")
                        cell.eBookThumbnailImageView.contentMode = .scaleAspectFit
                    }
                }
                
                // 분류
                cell.eBookKindLabel.text = "eBook"
                
                // 평점 및 리뷰
                let averageRating = self.bookInfo[indexPath.row].volumeInfo.averageRating ?? nil
                if averageRating != nil {
                    cell.eBookAverageRatingLabel.text = String(averageRating!) + "★"
                }else{
                    cell.eBookAverageRatingLabel.text = " "
                }
                
            } else {
                //video 데이터
                
                // 비디오 제목
                cell.eBookTitleLabel.text = self.videoInfo[indexPath.row].snippet.title
                // 비디오 채널명
                cell.eBookAuthorsLabel.text = self.videoInfo[indexPath.row].snippet.channelTitle
                // 분류
                cell.eBookKindLabel.text = "youTube"
                // 평점 및 리뷰 없음.
                cell.eBookAverageRatingLabel.text = " "
                // 비디오 썸네일 이미지
                let thumbnailImg = self.videoInfo[indexPath.row].snippet.thumbnails?.medium?.url
                let highImg = self.videoInfo[indexPath.row].snippet.thumbnails?.high?.url
                cell.eBookThumbnailImageView.contentMode = .scaleAspectFill
                
                if thumbnailImg != nil {
                    cell.eBookThumbnailImageView.load(urlString: thumbnailImg!)
                }else {
                    if highImg != nil {
                        cell.eBookThumbnailImageView.load(urlString: highImg!)
                    }else{
                        cell.eBookThumbnailImageView.image = UIImage(named: "noimage")
                        cell.eBookThumbnailImageView.contentMode = .scaleAspectFit
                    }
                }
            }
            
            return cell
        }
    }
    
    // collectionView cell size
    // UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == menuBarCollectionView){
             let width = view.bounds.width / CGFloat(menudata.count)
             let height = collectionView.bounds.height
             return CGSize(width: width, height: height)
        }else{
            if isEBook {
                let width = collectionView.bounds.width
                let height = collectionView.bounds.height / 6
                return CGSize(width: width, height: height)
            } else {
                let width = collectionView.bounds.width
                let height = collectionView.bounds.height / 7
                return CGSize(width: width, height: height)
            }
        }
    }
    
    // headerview
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (collectionView == menuBarCollectionView){
            return UICollectionReusableView.init()
        }else{
            let headerView = eBookCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: EBookCollectionReusableView.id, for: indexPath) as! EBookCollectionReusableView
            return headerView
        }
    }

    // headerview size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if (collectionView == menuBarCollectionView){
            return CGSize(width: 0, height: 0)
        }else{
            let width = collectionView.bounds.width
            return CGSize(width: width, height: 80)
        }
    }
    
    // select cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let searchText = searchField.text
        
        if (collectionView == menuBarCollectionView){
            if indexPath.row == 0 {
                // 메뉴바 하단 view - eBook 위치로 이동, 사이즈 줄이기
                isEBook = true
                UIView.animate(withDuration: 0.5, animations: {
                    self.selectBarView.transform = CGAffineTransform.init(translationX: 0, y: 0).concatenating(CGAffineTransform.init(scaleX: 1, y: 1))
                })
                setNetwork(searchText: searchText ?? "")
                
            } else {
                // 메뉴바 하단 view -오디오북 위치로 이동, 사이즈 늘리기
                isEBook = false
                UIView.animate(withDuration: 0.5, animations: {
                    self.selectBarView.transform = CGAffineTransform.init(translationX: 125, y: 0).concatenating(CGAffineTransform.init(scaleX: 1.5, y: 1))
                })
                setNetwork(searchText: searchText ?? "")
            }
            
        } else {
            if isEBook {
                // eBook 상세화면으로 이동
                let detailViewController: DetailViewController = DetailViewController()
                detailViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                detailViewController.isEBook = true
                detailViewController.ebookInfo = self.bookInfo[indexPath.row]
                self.presentDetail(detailViewController)
            } else {
                // video 상세화면으로 이동
                let detailViewController: DetailViewController = DetailViewController()
                detailViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                detailViewController.isEBook = false
                detailViewController.videoInfo = self.videoInfo[indexPath.row]
                detailViewController.videoId = self.videoInfo[indexPath.row].id?.videoId
                self.presentDetail(detailViewController)
            }
            
        }

    }
    
    // 마지막 cell일경우 데이터 더 불러오기
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (collectionView == menuBarCollectionView) {
            //
        }else{
            if indexPath.row == collectionView.numberOfItems(inSection: indexPath.section) - 1 {
                if isEBook {
                    bookIndex += 1
                    loadMoreBookData(index: bookIndex)
                } else {
                    videoIndex += 1
                    loadMoreVideoData(index: videoIndex)
                }
            }
        }
    }
}

// textField -> 검색
extension ViewController: UITextFieldDelegate {
    
    func configuereSearch() {
        searchField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 검색
        textField.resignFirstResponder()
        
        if textField.text != nil {
            setNetwork(searchText: textField.text!)
        }else{
            // 검색어가 없을때 알럿
            let alert = UIAlertController(title: "알림", message: "검색어를 입력하세요.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            present(alert, animated: false, completion: nil)
        }
        return true
    }
}
