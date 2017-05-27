//
//  ViewController.swift
//  Fetch Image
//
//  Created by Jin Kato on 5/26/17.
//  Copyright © 2017 Jin Kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK : Properties
    
    let myImageView:UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .blue
        return iv
    }()
    
    //MARK : Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutImageView()
        fetch()
    }
    
    //MARK : Helper
    
    fileprivate func fetch(){
        let sharedSession = URLSession.shared
        if let url = URL(string: "https://goo.gl/wV9G4I") {
            let request = URLRequest(url: url)
            let dataTask = sharedSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.myImageView.image = image
                    }
                }
            })
            dataTask.resume()
        }
    }
    
    //MARK : Layout
    
    fileprivate func layoutImageView(){
        view.addSubview(myImageView)
        myImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        myImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        myImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}

