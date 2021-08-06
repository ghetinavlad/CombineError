//
//  ViewController.swift
//  Combineprct
//
//  Created by Wolfpack Digital on 06.08.2021.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    let combineApi = API()
    var observer: AnyCancellable?
    
    private var users: [User] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        observer = combineApi.fetchUsers().sink(receiveValue: {
            [weak self] users in
            self?.users = users
        })
        
        //print(users)
        
        // Do any additional setup after loading the view.
    }


}

