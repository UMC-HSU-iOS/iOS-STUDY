//
//  ViewController.swift
//  Week2Mission
//
//  Created by Choi76 on 2023/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func viewChange(_ sender: Any) {
        //1. 이동할 뷰 찾기 => 변수에 할당
        if let nextView = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController"){ //identity를 통해 찾기
            
            //2. 찾은 뷰 네비게이션컨트롤러 스택에 푸시
            self.navigationController?.pushViewController(nextView, animated: true)
        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

