import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl: UIRefreshControl?
    var articlesData: [ArticleModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ArticleManager = ApiManager()
        func update (data:[ArticleModel]) {
            articlesData = data
            tableView.reloadData()
        }
        ArticleManager.fetchPhotosData(successCallback: update);
        addRefreshControl()
        
    }
    
    func addRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = UIColor.gray
        refreshControl?.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        tableView.addSubview(refreshControl!)
    }
    
    @objc func refreshList(){
        refreshControl?.endRefreshing()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func noData(message:String, viewController: ViewController) {
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: view.bounds.size.width, height: view.bounds.size.height))
        let noDataMessage = UILabel(frame: rect)
        noDataMessage.text = message
        noDataMessage.textColor = UIColor.black
        noDataMessage.numberOfLines = 0;
        noDataMessage.font = UIFont(name: "Georgia", size: 35)
        noDataMessage.textAlignment = .center;
        noDataMessage.sizeToFit()
        
        viewController.tableView.backgroundView = noDataMessage;
        viewController.tableView.separatorStyle = .none;
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     //   return articlesData.count
        if articlesData.count > 0 {
            noData(message: "", viewController: self)
            return articlesData.count
        } else {
            noData(message: "No data", viewController: self)
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        if articlesData[indexPath.row].author == "" {
            articlesData[indexPath.row].author = "National Geographic"
        }
        cell.lblAuthor.text = articlesData[indexPath.row].author
        cell.lblTitle.text = articlesData[indexPath.row].title
        cell.img.kf.setImage(with: URL(string: articlesData[indexPath.row].urlToImage))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


