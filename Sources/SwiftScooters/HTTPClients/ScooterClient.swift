import Alamofire
import SwiftyJSON
import Foundation

class ScooterClient: Client {
    
    var sessionManager: Session
    var serviceLocatorConfi: URLComponents
    public var onSuccess: ((JSON?) -> Void)?
    public var onFailure: ((Int?, String?) -> Void)?

    public init(
        sessionManager session: Alamofire.Session,
        serviceLocatorURL config: URLComponents
    ) {
        self.sessionManager = session
        self.serviceLocatorConfi = config
    }

    func fetch() {
        guard let urlString = self.serviceLocatorConfi.string else { return }
        guard let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else { return }
        guard let url = URL(string: encoded) else { return }
                
        
        sessionManager.request(url).responseString { response in
            self.handleResponse(response)
        }
    }
}
