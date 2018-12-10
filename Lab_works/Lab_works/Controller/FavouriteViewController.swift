import UIKit

class FavouriteViewController: UIViewController {

    @IBOutlet weak var nodataView: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl: UIRefreshControl?
    var articlesData: [ArticleModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ArticleManager = ApiManager()
        ArticleManager.fetchPhotosData(successCallback: update)
        addRefreshControl()
        nodataView.isHidden = false
        tableView.isHidden = false
    }
    
    func update (data:[ArticleModel]) {
        changeListVisibility(data.count > 0)
        articlesData = data
        tableView.reloadData()
    }
    
    func changeListVisibility(_ visible: Bool) {
        nodataView.isHidden = visible;
        tableView.isHidden = !visible;
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.lblAuthor.text = articlesData[indexPath.row].author
        cell.lblTitle.text = articlesData[indexPath.row].title
        // cell.img.kf.setImage(with: URL(string: articlesData[indexPath.row].urlToImage))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

