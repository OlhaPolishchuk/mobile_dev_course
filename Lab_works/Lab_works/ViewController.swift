import UIKit

class ViewController: UIViewController {
    let controllerApiManager: ApiManager = ApiManager()
    @IBAction func pressMeButton(_ sender: UIButton) {
        let ArticleManager = ApiManager()
        ArticleManager.fetchPhotosData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

