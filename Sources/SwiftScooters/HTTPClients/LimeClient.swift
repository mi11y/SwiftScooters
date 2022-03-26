import Alamofire
import SwiftyJSON
import Foundation

class LimeClient: ScooterClient {
    
    var sessionManager: Session
    public var onSuccess: ((JSON?) -> Void)?
    public var onFailure: ((Int?, String?) -> Void)?

    public init(sessionManager session: Alamofire.Session) {
        self.sessionManager = session
    }

    func fetch() {
        guard let urlString = ServiceLocator.limeConfig().string else { return }
        guard let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else { return }
        guard let url = URL(string: encoded) else { return }
                
        
        sessionManager.request(url).responseString { response in
            self.handleResponse(response)
        }
    }
}
