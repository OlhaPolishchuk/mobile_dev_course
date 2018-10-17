//
//  ViewController.swift
//  Lab_works
//
//  Created by Olha Polishchuk on 16.10.18.
//  Copyright © 2018 Olga. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    var articlesData: [ArticleModel] = []
    
    @IBAction func pressMeButton(_ sender: UIButton) {
        fetchPhotosData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fetchPhotosData(){
        DispatchQueue.main.async {
            Alamofire.request("https://newsapi.org/v2/everything?domains=nationalgeographic.com&apiKey=7e11ca926e534fefa89e0cb71c19acb8").responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    json["articles"].array?.forEach({ (article) in
                        let article = ArticleModel(author: article["author"].stringValue, title: article["title"].stringValue, urlToImage: article["urlToImage"].stringValue)
                        self.articlesData.append(article)
                    })
                    print(self.articlesData)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

