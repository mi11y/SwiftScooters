
import Foundation

public class ServiceLocator {
    public static func limeConfig() -> URLComponents {
        var components =  initURLComponents()
        components.host = "data.lime.bike"
        components.path = "/api/partners/v1/gbfs/portland/free_bike_status.json"
        return components
    }
    
    public static func spinConfig() -> URLComponents {
        var components  = initURLComponents()
        components.host = "gbfs.spin.pm"
        components.path = "/api/gbfs/v1/portland/free_bike_status.json"
        return components
    }
    
    public static func birdConfig() -> URLComponents {
        var components  = initURLComponents()
        components.host = "mds.bird.co"
        components.path = "/gbfs/portland/free_bike_status.json"
        return components
    }
    
    public static func boltConfig() -> URLComponents {
        var components  = initURLComponents()
        components.host = "api-lb.micromobility.com"
        components.path = "/ptl/gbfs/en/free_bike_status.json"
        return components
    }
    
    public static func biketownConfig() -> URLComponents {
        var components  = initURLComponents()
        components.host = "gbfs.biketownpdx.com"
        components.path = "/gbfs/en/free_bike_status.json"
        return components
    }
    
    public static func biketownInformationConfig() -> URLComponents {
        var components  = initURLComponents()
        components.host = "gbfs.biketownpdx.com"
        components.path = "/gbfs/en/station_information.json"
        return components
    }
    
    public static func biketownStatusConfig() -> URLComponents {
        var components  = initURLComponents()
        components.host = "gbfs.biketownpdx.com"
        components.path = "/gbfs/en/station_status.json"
        return components
    }
    
    private static func initURLComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = "http"
        return components
    }
}
