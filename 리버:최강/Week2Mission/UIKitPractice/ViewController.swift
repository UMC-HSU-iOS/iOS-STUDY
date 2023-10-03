//
//  ViewController.swift
//  UIKitPractice
//
//  Created by Choi76 on 2023/09/20.
//

import UIKit

class ViewController: UIViewController {
    
    //상단 UIView
    lazy var titleUIView : UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false //제약조건 직접 지정 처리
        uiView.backgroundColor = UIColor(red: 42/255.0, green: 193/255.0, blue: 188/255.0, alpha: 1.0)
        return uiView
    }()
    
    //검색 부분 UIView
    lazy var searchUIView : UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = UIColor(red: 42/255.0, green: 193/255.0, blue: 188/255.0, alpha: 1.0)
        uiView.layer.cornerRadius = 15 //둥글게 만들 정도 지정
        //왼쪽 위(layerMinXMinYCorner),오른쪽 위(layerMaxXMinYCorner),왼쪽 아래(layerMinXMaxYCorner), 오른쪽 아래(layerMaxXMaxYCorner)
        //여러 모서리를 변경하고 싶을때는 arrayLiteral로 지정
        uiView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        return uiView
    }()
    
    //하단바
    lazy var navigationUIView : UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .white
        uiView.layer.cornerRadius = 15 //둥글게 만들 정도 지정
        //왼쪽 위(layerMinXMinYCorner),오른쪽 위(layerMaxXMinYCorner),왼쪽 아래(layerMinXMaxYCorner), 오른쪽 아래(layerMaxXMaxYCorner)
        //여러 모서리를 변경하고 싶을때는 arrayLiteral로 지정
        uiView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        return uiView
    }()
    

    //광고버튼스택뷰
    lazy var adBtnStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal //수평
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    lazy var scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.backgroundColor = .systemGray6
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()
    
    //알뜰, 한집배달 UIView
    lazy var deliveryListUIView : UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false //직접 위치 지정
        uiView.backgroundColor = .white //하얀색으로 배경 설정
        uiView.layer.cornerRadius = 10 //코너 둥글게
        //모든 방향 둥글게 적용
        uiView.layer.maskedCorners = CACornerMask(
            arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner,
                .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        return uiView
    }()
    
    lazy var placeTextView : UIButton = {
        let uiButton = UIButton()
        uiButton.setTitle("우리집 ", for: .normal)
        uiButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        uiButton.setTitleColor(.white, for: .normal)
//        uiButton.backgroundColor = UIColor(red: 42/255.0, green: 193/255.0, blue: 188/255.0, alpha: 1.0)
        if let triangleImage = UIImage(named: "icon_triangle")?.withRenderingMode(.alwaysTemplate) {
            uiButton.setImage(triangleImage, for: .normal)
        }
        uiButton.tintColor = .white  // 이 부분에서 tintColor를 변경
        uiButton.semanticContentAttribute = .forceRightToLeft // 이미지를 오른쪽에 배치
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        return uiButton
    }()
    
    lazy var menuUIButton: UIButton = {
        let uiButton = UIButton()
        uiButton.setTitleColor(.white, for: .normal) //버튼의 색상 변경
        if let buttonImage = UIImage(named: "icon_menu")?.withRenderingMode(.alwaysTemplate) {
            uiButton.setImage(buttonImage, for: .normal)
        }
        uiButton.tintColor = .white  // 이 부분에서 tintColor를 변경
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        return uiButton
    }()

    
    lazy var alarmUIButton: UIButton = {
        let uiButton = UIButton()
        uiButton.setTitleColor(.white, for: .normal) //버튼의 색상 변경
        if let buttonImage = UIImage(named: "icon_bell")?.withRenderingMode(.alwaysTemplate) {
            uiButton.setImage(buttonImage, for: .normal)
        }
        uiButton.tintColor = .white  // 이 부분에서 tintColor를 변경
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        return uiButton
    }()

    
    lazy var cartUIButton: UIButton = {
        let uiButton = UIButton()
        uiButton.setTitleColor(.white, for: .normal) //버튼의 색상 변경
        if let buttonImage = UIImage(named: "icon_cart")?.withRenderingMode(.alwaysTemplate) {
            uiButton.setImage(buttonImage, for: .normal)
        }
        uiButton.tintColor = .white  // 이 부분에서 tintColor를 변경
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        return uiButton
    }()

    
    
    
    //검색창
    lazy var searchBarView : UISearchBar = {
        let uiSearchBar = UISearchBar()
        uiSearchBar.translatesAutoresizingMaskIntoConstraints = false
        uiSearchBar.backgroundColor = .white
        uiSearchBar.text = "찾는 메뉴가 뭐예요?"
        uiSearchBar.searchTextField.backgroundColor = .white
        return uiSearchBar
    }()
    
    
    
    //알뜰 한집 배달 관련 정보들
    lazy var deliveryListStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5 // 각 아이템마다의 여백?
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //알뜰,한집 배달에 버튼들을 넣기 위한 스택뷰
    lazy var inputStackView0 : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //하단바 관련 스택
    lazy var navBarStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    lazy var deliveryStackViewTitle : UITextView = {
        let uiTextView = UITextView()
        uiTextView.text = "알뜰 한집배달"
        uiTextView.translatesAutoresizingMaskIntoConstraints = false
        return uiTextView
    }()
    
    //알뜰,한집 배달에 버튼들을 넣기 위한 스택뷰
    lazy var inputStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10 // 각 아이템마다의 여백?
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //알뜰,한집 배달에 버튼들을 넣기 위한 스택뷰2
    lazy var inputStackView2 : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10 // 각 아이템마다의 여백?
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //알뜰,한집 배달 관련 버튼들
    lazy var testButton1 : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(named: "btn_1-removebg-preview")
        button.setImage(buttonImage, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    
    lazy var testButton2 : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(named: "btn_2-removebg-preview")
        button.setImage(buttonImage, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()

    lazy var testButton3 : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(named: "btn_3-removebg-preview")
        button.setImage(buttonImage, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var testButton4 : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(named: "btn_4-removebg-preview")
        button.setImage(buttonImage, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var testButton5 : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(named: "btn_5-removebg-preview")
        button.setImage(buttonImage, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var testButton6 : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(named: "btn_6-removebg-preview")
        button.setImage(buttonImage, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var testButton7 : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(named: "btn_7-removebg-preview")
        button.setImage(buttonImage, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var testButton8 : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(named: "btn_8-removebg-preview")
        button.setImage(buttonImage, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var testButton9 : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(named: "btn_9-removebg-preview")
        button.setImage(buttonImage, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var testButton10 : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(named: "btn_10-removebg-preview")
        button.setImage(buttonImage, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    
    //하단 메뉴 이미지들
    lazy var menuImageView1 : UIImageView = {
        let uiImageView = UIImageView()
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        uiImageView.image = UIImage(named:"icon_heart")
        return uiImageView
    }()
    

    //하단바 메인버튼
    lazy var mainBtnImageView : UIImageView = {
        let uiImageView = UIImageView()
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        uiImageView.image = UIImage(named:"icon_main")
        return uiImageView
    }()
    
    
    
    //광고배너 ImageView
    lazy var bannerImageView : UIImageView = {
        let uiImageView = UIImageView()
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        uiImageView.image = UIImage(named:"img_banner")
        return uiImageView
    }()
    
    //배달 버튼
    lazy var deliveryButton : UIButton = {
        let uiButton = UIButton()
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(named: "btn_large") //
        uiButton.setImage(buttonImage, for: .normal)
        return uiButton
    }()
    
    //배달 버튼
    lazy var deliveryButton2 : UIButton = {
        let uiButton = UIButton()
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(named: "btn_large2") //
        uiButton.setImage(buttonImage, for: .normal)
        return uiButton
    }()
    
    //배달 버튼
    lazy var deliveryButton3 : UIButton = {
        let uiButton = UIButton()
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(named: "btn_large3") //
        uiButton.setImage(buttonImage, for: .normal)
        return uiButton
    }()
    

    //하단 광고
    lazy var advertismentImageView : UIImageView = {
        let uiImageView = UIImageView()
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        uiImageView.image = UIImage(named:"img_advertisment")
        return uiImageView
    }()
    
    
    
    lazy var navUIView : UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .white
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.layer.cornerRadius = 15 //둥글게 만들 정도 지정
        //왼쪽 위(layerMinXMinYCorner),오른쪽 위(layerMaxXMinYCorner),왼쪽 아래(layerMinXMaxYCorner), 오른쪽 아래(layerMaxXMaxYCorner)
        //여러 모서리를 변경하고 싶을때는 arrayLiteral로 지정
        uiView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        return uiView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        // Do any additional setup after loading the view.
        
    
        //MARK: 우리집, menu, alaram, cart button부분
        view.addSubview(titleUIView) //화면에 뷰 붙이기
        //타이틀 UIView에 대한 constraints 작성 => isActive를 활성화 해야 적용됨
        let titleUIViewConstraint = [
            titleUIView.heightAnchor.constraint(equalToConstant: 100), //뷰의 세로 높이
            titleUIView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor), //뷰의 시작 지점
            titleUIView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor), //뷰의 끝 지점
            titleUIView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0) //뷰가 생성될 위치
        ]
        NSLayoutConstraint.activate(titleUIViewConstraint)
        
        view.addSubview(placeTextView)
        let placeTextViewConstraint = [
            placeTextView.heightAnchor.constraint(equalToConstant: 20), //뷰의 세로 높이
            placeTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16), //뷰의 시작 지점
            placeTextView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 75) //뷰가 생성될 위치
        ]
        NSLayoutConstraint.activate(placeTextViewConstraint)
        
        view.addSubview(menuUIButton)
        let menuUIButtonConstraint = [
            menuUIButton.heightAnchor.constraint(equalToConstant: 20), //뷰의 세로 높이
            menuUIButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -80), //뷰의 끝 지점
            menuUIButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 75), //뷰가 생성될 위치
            // 생성될 버튼의 크기 지정
            menuUIButton.widthAnchor.constraint(equalToConstant: 50),
            menuUIButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(menuUIButtonConstraint)
        
        view.addSubview(alarmUIButton)
        let alarmUIButtonConstraint = [
            alarmUIButton.heightAnchor.constraint(equalToConstant: 20), //뷰의 세로 높이
            alarmUIButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -42), //뷰의 끝 지점
            alarmUIButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 75), //뷰가 생성될 위치
            // 생성될 버튼의 크기 지정
            alarmUIButton.widthAnchor.constraint(equalToConstant: 50),
            alarmUIButton.heightAnchor.constraint(equalToConstant: 50)
            
        ]
        NSLayoutConstraint.activate(alarmUIButtonConstraint)
        
        view.addSubview(cartUIButton)
        let cartUIButtonConstraint = [
            cartUIButton.heightAnchor.constraint(equalToConstant: 20), //뷰의 세로 높이
            cartUIButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -4), //뷰의 끝 지점
            cartUIButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 75), //뷰가 생성될 위치
            cartUIButton.widthAnchor.constraint(equalToConstant: 50),
            cartUIButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(cartUIButtonConstraint)
        
        
        

        //MARK: NavUIView
        view.addSubview(navUIView)
        let navUIViewConstraint = [
            navUIView.heightAnchor.constraint(equalToConstant: 200),
            navUIView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            navUIView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            navUIView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(navUIViewConstraint)
        
        
        view.addSubview(mainBtnImageView)
        let mainBtnImageViewConstraint = [
            mainBtnImageView.heightAnchor.constraint(equalToConstant: 100), //뷰 높이 지정
            mainBtnImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),

            mainBtnImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(mainBtnImageViewConstraint)
        
        
        
        
        
        
        
        //MARK: 스크롤뷰
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        
        //스크롤뷰 안에 둘 contentView
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true // contentView의 너비는 스크롤뷰와 같게 설정
        
        
        //MARK: 검색창 UIVIew
        contentView.addSubview(searchUIView)
        let searchUIViewConstraint = [
            searchUIView.heightAnchor.constraint(equalToConstant: 65),
            searchUIView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            searchUIView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            searchUIView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(searchUIViewConstraint)
        
        
        
        view.addSubview(navigationUIView)
        let navigationUIViewConstraint = [
            navigationUIView.heightAnchor.constraint(equalToConstant: 85),
            navigationUIView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            navigationUIView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            navigationUIView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(navigationUIViewConstraint)
        
//        view.addSubview(heartButton)
//        let haertButtonConstraint = [
//            heartButton.heightAnchor.constraint(equalToConstant: 85),
//            heartButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            heartButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            heartButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
//        ]
//        NSLayoutConstraint.activate(navigationUIViewConstraint)
        
        
        
        contentView.addSubview(searchBarView)
        let searchBarViewConstraint = [
            searchBarView.heightAnchor.constraint(equalToConstant: 40),
            searchBarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15),
            searchBarView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -15),
            searchBarView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12)
        ]
        NSLayoutConstraint.activate(searchBarViewConstraint)
        
        
        
    
        
        //MARK: 검색창
        
    
        //MARK: 상단 광고배너 이미지 뷰
        contentView.addSubview(bannerImageView)
        let bannerImageViewConstraint = [
            bannerImageView.heightAnchor.constraint(equalToConstant: 100), //뷰 높이 지정
            bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            bannerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 70)
        ]
        NSLayoutConstraint.activate(bannerImageViewConstraint)
    
        
        //MARK: 배달버튼 스택뷰
        contentView.addSubview(adBtnStackView)
        let adBtnStackViewConstraint = [
            adBtnStackView.heightAnchor.constraint(equalToConstant: 120), //뷰 높이 지정
            adBtnStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            adBtnStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            adBtnStackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 170)
        ]
        NSLayoutConstraint.activate(adBtnStackViewConstraint)
        //버튼 붙이기
        adBtnStackView.addArrangedSubview(deliveryButton)
        adBtnStackView.addArrangedSubview(deliveryButton2)
        adBtnStackView.addArrangedSubview(deliveryButton3)

        
        //MARK: 알뜰 한집배달(배달 리스트)
        contentView.addSubview(deliveryListUIView)
        let deliveryUIViewConstraint = [
            deliveryListUIView.heightAnchor.constraint(equalToConstant: 200), //뷰 높이 지정
            deliveryListUIView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            deliveryListUIView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            deliveryListUIView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 300)
        ]
        NSLayoutConstraint.activate(deliveryUIViewConstraint)
        
        //버튼들을 저장할 스택뷰
        contentView.addSubview(deliveryListStackView)
        let deliveryStackViewConstraint = [
            deliveryListStackView.heightAnchor.constraint(equalToConstant: 200), //뷰 높이 지정
            deliveryListStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            deliveryListStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            deliveryListStackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 300)
        ]
        NSLayoutConstraint.activate(deliveryStackViewConstraint)

//        deliveryListStackView.addArrangedSubview(inputStackView0)
//        inputStackView0.addArrangedSubview(deliveryStackViewTitle)
        deliveryListStackView.addArrangedSubview(inputStackView)
        deliveryListStackView.addArrangedSubview(inputStackView2)
        
        //MARK: 알뜰 한집배달 => 스택뷰(상단부분)
        let inputStackViewConstraint = [
            inputStackView.heightAnchor.constraint(equalToConstant: 200), //뷰 높이 지정
            inputStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            inputStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            inputStackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 300)
        ]
        NSLayoutConstraint.activate(inputStackViewConstraint)
        inputStackView.addArrangedSubview(testButton1)
        inputStackView.addArrangedSubview(testButton2)
        inputStackView.addArrangedSubview(testButton3)
        inputStackView.addArrangedSubview(testButton4)
        inputStackView.addArrangedSubview(testButton5)
        
        inputStackView2.addArrangedSubview(testButton6)
        inputStackView2.addArrangedSubview(testButton7)
        inputStackView2.addArrangedSubview(testButton8)
        inputStackView2.addArrangedSubview(testButton9)
        inputStackView2.addArrangedSubview(testButton10)
        

        //MARK: 하단광고 이미지 뷰
        contentView.addSubview(advertismentImageView)
        let advertismentImageViewConstraint = [
            advertismentImageView.heightAnchor.constraint(equalToConstant: 130), //뷰 높이 지정
            advertismentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            advertismentImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            advertismentImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 520)
        ]
        NSLayoutConstraint.activate(advertismentImageViewConstraint)
        
        let labelTwo: UILabel = {
          let label = UILabel()
          label.text = "Scroll Bottom"
          label.backgroundColor = .red
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
        }()
        
        scrollView.addSubview(labelTwo)

        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1000).isActive = true
        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        

        
        
    }


    

}

