//
//  TestData.swift
//  
//
//  Created by Milly Guitron on 3/25/22.
//

import Foundation

public final class TestData {
    public static let limeDataJSON: URL = Bundle.module.url(forResource: "LimeScooterResponse", withExtension: "json")!
    public static let spinDataJSON: URL = Bundle.module.url(forResource: "SpinScooterResponse", withExtension: "json")!
    public static let birdDataJSON: URL = Bundle.module.url(forResource: "BirdScooterResponse", withExtension: "json")!
    public static let boltDataJSON: URL = Bundle.module.url(forResource: "BoltScooterResponse", withExtension: "json")!
    public static let biketownDataJSON: URL = Bundle.module.url(forResource: "BiketownResponse", withExtension: "json")!
    public static let biketownInformationDataJSON: URL = Bundle.module.url(forResource: "BiketownStationInformationResponse", withExtension: "json")!
    public static let biketownStatusDataJSON: URL = Bundle.module.url(forResource: "BiketownStatusInformation", withExtension: "json")!


}

internal extension URL {
    /// Returns a `Data` representation of the current `URL`. Force unwrapping as it's only used for tests.
    var data: Data {
        return try! Data(contentsOf: self)
    }
}
