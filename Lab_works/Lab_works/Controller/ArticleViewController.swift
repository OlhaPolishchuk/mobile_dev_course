import UIKit
// import Kingfisher

class ArticleViewController: UIViewController {
    var articlesData: [ArticleModel] = []
    var liked = false
    
    @IBOutlet weak var articleAuthor: UILabel!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var likeDislike: UIButton!
    
    @IBAction func likeButton(_ sender: UIButton) {
        if !liked {
            likeDislike.setImage(UIImage(named: "Liked"), for: .normal)
            liked = true
        } else {
            likeDislike.setImage(UIImage(named: "Unliked"), for: .normal)
            liked = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ArticleManager = ApiManager()
        ArticleManager.fetchPhotosData(successCallback: update);
    }
    
    func update (data:[ArticleModel]) {
        articlesData = data
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        articleAuthor.text = articlesData[0].author
        articleTitle.text = articlesData[0].title
       // articleImage.kf.setImage(with: URL(string: articlesData[0].urlToImage))
    }
}

