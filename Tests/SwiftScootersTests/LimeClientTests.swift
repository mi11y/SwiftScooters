
import XCTest
import Alamofire
import Foundation
import Mocker
import SwiftyJSON

@testable import SwiftScooters

class LimeClientTests: XCTestCase {
    
    func testConformsToScooterClient() {
        let expectation = self.expectation(description: "It conforms to the protocol")
        
        if LimeClient.self is ScooterClient.Type {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchOnSuccess() {
        let session = mockAPIResponse(MockConfigration())

        let expectation = self.expectation(description: "The correct endpoint was called")
        guard let expectedJSON = try? JSON(data: TestData.scooterJSON.data) else { XCTFail("Failed to parse test JSON"); return }

        let client = LimeClient(
            sessionManager: session
        )
        
        client.onSuccess = { (actualResponse: JSON?) -> Void in
            XCTAssertNotNil(actualResponse)
            XCTAssertEqual(actualResponse, expectedJSON)
            expectation.fulfill()
        }
        client.onFailure = { (_: Int?, _: String?) -> Void in
            XCTFail("onFailure handler was not supposed to be called")
        }
        client.fetch()

        wait(for: [expectation], timeout: 2.0)
    }
    
    
    func testFetchOnError() {
        var mockConfig = MockConfigration()
        mockConfig.statusCode = 400
        mockConfig.payload = try! JSONEncoder().encode("Bad Request")
        mockConfig.error = TestAPIError.message("Bad Request")
        let session = mockAPIResponse(mockConfig)
        
        let expectation = self.expectation(description: "onError handler called")
        let client = LimeClient(
            sessionManager: session
        )
        client.onSuccess = { (_: JSON?) -> Void in
            XCTFail("onSuccess should not have been called")
        }
        client.onFailure = { (_: Int?, _: String? ) -> Void in
            expectation.fulfill()
        }
        client.fetch()
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    
    // Test Helpers
    
    private enum TestAPIError: Error {
        case message(String)
    }
    
    private struct MockConfigration {
        var statusCode = 200
        var payload: Data = TestData.scooterJSON.data
        var error: TestAPIError? = nil
    }
    
    private func mockAPIResponse(_ config: MockConfigration) -> Session {
        
        let urlComponents = createURLComponents(config)
        mockSessionWithComponents(config, urlComponents)
        
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        return Alamofire.Session(configuration: configuration)
    }
    
    private func createURLComponents(_ config: MockConfigration) -> URLComponents {
        return ServiceLocator.limeConfig()
    }
    
    private func mockSessionWithComponents(_ config: MockConfigration, _ urlComponenets: URLComponents) {
        let apiEndpoint = createURLFromComponents(urlComponenets)
        
        if let error = config.error {
            Mock(
                url: apiEndpoint,
                ignoreQuery: false,
                dataType: .json,
                statusCode: config.statusCode,
                data: [
                    .get: config.payload
                ],
                requestError: error
            ).register()
        } else {
            Mock(
                url: apiEndpoint,
                ignoreQuery: false,
                dataType: .json,
                statusCode: config.statusCode,
                data: [
                    .get: config.payload
                ]
            ).register()
        }

    }
    
    private func createURLFromComponents(_ components: URLComponents) -> URL {
        let characterSet = NSCharacterSet(charactersIn: ",").inverted
        return URL(
            string: components.string!.addingPercentEncoding(
                withAllowedCharacters: characterSet
            )!
        )!
    }
}
