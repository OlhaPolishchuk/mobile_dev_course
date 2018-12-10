import Foundation

class FavouriteManager {
    static func submitDataWith(model: ArticleModel) {
        var models: [ArticleModel] = []
        func update (data:[ArticleModel]) {
            models = data
        }
        if isKeyPresentInUserDefaults() {
            models.append(model)
            UserDefaults.standard.removeObject(forKey: FavouriteManager.Constants.modelKey)
            UserDefaults.standard.set(models, forKey: FavouriteManager.Constants.modelKey)
            UserDefaults.standard.synchronize()
        } else if (isKeyPresentInUserDefaults() != true){
            models.append(model)
            UserDefaults.standard.set(models, forKey: FavouriteManager.Constants.modelKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func removeFromUserDefaults() {
        UserDefaults.standard.removeObject(forKey: FavouriteManager.Constants.modelKey)
    }
    
    static func isKeyPresentInUserDefaults() -> Bool {
        return UserDefaults.standard.object(forKey: FavouriteManager.Constants.modelKey) != nil
    }
}

private extension FavouriteManager {
    enum Constants {
        static let modelKey = "favorite"
    }
}
