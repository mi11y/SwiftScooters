
import XCTest
import Foundation
import SwiftyJSON

@testable import SwiftScooters

class ClientTests: XCTestCase {
    
    func testConformsToScooterClient() {
        let expectation = self.expectation(description: "It conforms to the protocol")
        
        if ScooterClient.self is Client.Type {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchLimeOnSuccess() {
        let mockConfiguration = MockConfiguration.init()
        mockConfiguration.setStatusCode(200)
        mockConfiguration.setDataResponse(TestData.limeDataJSON.data)
        mockConfiguration.setAPIURL(ServiceLocator.limeConfig())
        let session = mockConfiguration.mockAPIResponse()

        let expectation = self.expectation(description: "The correct endpoint was called")
        guard let expectedJSON = try? JSON(data: TestData.limeDataJSON.data) else { XCTFail("Failed to parse test JSON"); return }

        let client = ScooterClient(
            sessionManager: session,
            serviceLocatorURL: ServiceLocator.limeConfig()
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
    
    func testFetchLimeOnError() {
        let mockConfiguration = MockConfiguration.init()
        mockConfiguration.setStatusCode(400)
        mockConfiguration.setError("Bad Request")
        mockConfiguration.setDataResponse(TestData.limeDataJSON.data)
        mockConfiguration.setAPIURL(ServiceLocator.limeConfig())
        let session = mockConfiguration.mockAPIResponse()
        
        let expectation = self.expectation(description: "onError handler called")
        let client = ScooterClient(
            sessionManager: session,
            serviceLocatorURL: ServiceLocator.limeConfig()
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
    
    func testFetchSpinOnSuccess() {
        let mockConfiguration = MockConfiguration.init()
        mockConfiguration.setStatusCode(200)
        mockConfiguration.setDataResponse(TestData.spinDataJSON.data)
        mockConfiguration.setAPIURL(ServiceLocator.spinConfig())
        
        let session = mockConfiguration.mockAPIResponse()

        let expectation = self.expectation(description: "The correct endpoint was called")
        guard let expectedJSON = try? JSON(data: TestData.spinDataJSON.data) else { XCTFail("Failed to parse test JSON"); return }

        let client = ScooterClient(
            sessionManager: session,
            serviceLocatorURL: ServiceLocator.spinConfig()
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
    
    func testFetchSpinOnError() {
        let mockConfiguration = MockConfiguration.init()
        mockConfiguration.setStatusCode(400)
        mockConfiguration.setError("Bad Request")
        mockConfiguration.setDataResponse(TestData.spinDataJSON.data)
        mockConfiguration.setAPIURL(ServiceLocator.spinConfig())
        
        let session = mockConfiguration.mockAPIResponse()
        
        let expectation = self.expectation(description: "onError handler called")
        let client = ScooterClient(
            sessionManager: session,
            serviceLocatorURL: ServiceLocator.spinConfig()
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
}
