//
//  ViewController.swift
//  DicePractice
//
//  Created by Choi76 on 2023/09/30.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var diceImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "dice-one"))

        image.translatesAutoresizingMaskIntoConstraints = false //화면의 위치를 직접 지정하도록 하겠다
        return image
    }()
    
    //주사위의 모양을 변경할 버튼
    lazy var changeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("눌러주세요", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false //직접 위치 지정
        return button
    }()
    
    
    //개발자리 랜덤 주사위 그리기
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(diceImageView)
        //주사위의 높이 300으로 지정
        diceImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        //주사위의 너비 300으로 지정
        diceImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        //주사위의 x위치를 가운데로 지정
        diceImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //주사위의 y위치를 가운데로 지정
        diceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //버튼의 위치 지정
        view.addSubview(changeButton)
        //버튼의 높이 50으로 지정
        changeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //버튼의 너비를 200으로 지정
        changeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //버튼의 x위치를 가운데로 지정
        changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //변경버튼 탑 위치(앵커)를 주사위 이미지의 바닥으로부터 200만큼 떨어지도록 지정
        changeButton.topAnchor.constraint(equalTo: diceImageView.bottomAnchor,constant: 200).isActive = true
        
        //버튼에 이벤트 달아주기
        //해당 뷰에서(self) touchUpInside 이벤트 발생시, didTapChangeDiceImageButton호출
        changeButton.addTarget(self, action: #selector(didTapChangeDiceImageButton), for: .touchUpInside)
        
        }
    
    
    //버튼 클릭 이벤트 작성
    @objc func didTapChangeDiceImageButton(){
        let diceList = ["dice-one","dice-two","dice-three","dice-four","dice-five","dice-six"]
        //랜덤으로 이미지 변경
        diceImageView.image = UIImage(named: diceList.randomElement() ?? "dice-one")
    }
}

