
import Foundation

public class ServiceLocator {
    public static func limeConfig() -> URLComponents {
        var components =  initURLComponents()
        components.host = "data.lime.bike"
        components.path = "/api/partners/v1/gbfs/portland/free_bike_status.json"
        return components
    }
    
    private static func initURLComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = "http"
        return components
    }
}
