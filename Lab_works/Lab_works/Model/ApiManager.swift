import Foundation
import Alamofire
import SwiftyJSON

class ApiManager{
    private let API_URL = URL(string: "https://newsapi.org/v2/everything?domains=nationalgeographic.com&apiKey=7e11ca926e534fefa89e0cb71c19acb8")!
    
    public func fetchPhotosData(successCallback: @escaping ([ArticleModel])-> Void){
        Alamofire.request(self.API_URL).responseJSON { response in
            switch response.result {
            case .success(let value):
                DispatchQueue.main.async {
                    self.parseData(value, successCallback: successCallback)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    fileprivate func parseData(_ value: (Any),
                               successCallback: ([ArticleModel]) -> Void) {
        var articlesData: [ArticleModel] = []
        let json = JSON(value)
        json["articles"].array?.forEach({ (article) in
            let article = ArticleModel(author: article["author"].stringValue, title: article["title"].stringValue, urlToImage: article["urlToImage"].stringValue)
            articlesData.append(article)
        })
        successCallback(articlesData);
    }
}
