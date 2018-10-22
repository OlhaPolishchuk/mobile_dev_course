import Foundation
import Alamofire
import SwiftyJSON

class ApiManager{
    var articlesData: [ArticleModel] = []
    private let API_URL = URL(string: "https://newsapi.org/v2/everything?domains=nationalgeographic.com&apiKey=7e11ca926e534fefa89e0cb71c19acb8")!
    
    public func fetchPhotosData(){
        DispatchQueue.main.async {
            Alamofire.request(self.API_URL).responseJSON { response in
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
}

