import Foundation

class ApiManager: NSObject {
    
    let baseURL = "https://api.randomuser.me/"
    
    func getRandomUser(completion: @escaping (Any) -> Void) {
        
        var request = URLRequest(url: URL(string: baseURL)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, err in
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                let results = json["results"] as! NSArray
                completion(results[0])
            } catch let error as NSError {
                print(error)
            }
            
            }.resume()
        
    }
    
}
