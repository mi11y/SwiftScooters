
import XCTest
import Foundation
import SwiftyJSON
import SwiftHelpers

@testable import SwiftScooters

class ClientTests: XCTestCase {
    func testConformsToScooterClient() {
        let expectation = self.expectation(description: "It conforms to the protocol")
        
        if ScooterClient.self is HTTPClient.Type {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchLimeOnSuccess() {
        let mockConfiguration = MockConfiguration.init()
        mockConfiguration.setStatusCode(200)
        mockConfiguration.setDataResponse(TestData.limeDataJSON.data)
        mockConfiguration.setAPIURL(ServiceLocator.limeConfig())
        mockConfiguration.ignoreQuery = true
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
        mockConfiguration.ignoreQuery = true
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
        mockConfiguration.ignoreQuery = true

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
        mockConfiguration.ignoreQuery = true

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
    
    func testFetchBirdOnSuccess() {
        let mockConfiguration = MockConfiguration.init()
        mockConfiguration.setStatusCode(200)
        mockConfiguration.setDataResponse(TestData.birdDataJSON.data)
        mockConfiguration.setAPIURL(ServiceLocator.birdConfig())
        mockConfiguration.ignoreQuery = true

        let session = mockConfiguration.mockAPIResponse()

        let expectation = self.expectation(description: "The correct endpoint was called")
        guard let expectedJSON = try? JSON(data: TestData.birdDataJSON.data) else { XCTFail("Failed to parse test JSON"); return }

        let client = ScooterClient(
            sessionManager: session,
            serviceLocatorURL: ServiceLocator.birdConfig()
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
    
    func testFetchBirdOnError() {
        let mockConfiguration = MockConfiguration.init()
        mockConfiguration.setStatusCode(400)
        mockConfiguration.setError("Bad Request")
        mockConfiguration.setDataResponse(TestData.birdDataJSON.data)
        mockConfiguration.setAPIURL(ServiceLocator.birdConfig())
        mockConfiguration.ignoreQuery = true

        let session = mockConfiguration.mockAPIResponse()
        
        let expectation = self.expectation(description: "onError handler called")
        let client = ScooterClient(
            sessionManager: session,
            serviceLocatorURL: ServiceLocator.birdConfig()
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
    
    func testFetchBoltOnSuccess() {
        let mockConfiguration = MockConfiguration.init()
        mockConfiguration.setStatusCode(200)
        mockConfiguration.setDataResponse(TestData.boltDataJSON.data)
        mockConfiguration.setAPIURL(ServiceLocator.boltConfig())
        mockConfiguration.ignoreQuery = true

        let session = mockConfiguration.mockAPIResponse()

        let expectation = self.expectation(description: "The correct endpoint was called")
        guard let expectedJSON = try? JSON(data: TestData.boltDataJSON.data) else { XCTFail("Failed to parse test JSON"); return }

        let client = ScooterClient(
            sessionManager: session,
            serviceLocatorURL: ServiceLocator.boltConfig()
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
    
    func testFetchBoltOnError() {
        let mockConfiguration = MockConfiguration.init()
        mockConfiguration.setStatusCode(400)
        mockConfiguration.setError("Bad Request")
        mockConfiguration.setDataResponse(TestData.boltDataJSON.data)
        mockConfiguration.setAPIURL(ServiceLocator.boltConfig())
        mockConfiguration.ignoreQuery = true

        let session = mockConfiguration.mockAPIResponse()
        
        let expectation = self.expectation(description: "onError handler called")
        let client = ScooterClient(
            sessionManager: session,
            serviceLocatorURL: ServiceLocator.boltConfig()
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
    
    func testFetchBiketownOnSuccess() {
        let mockConfiguration = MockConfiguration.init()
        mockConfiguration.setStatusCode(200)
        mockConfiguration.setDataResponse(TestData.biketownDataJSON.data)
        mockConfiguration.setAPIURL(ServiceLocator.biketownConfig())
        mockConfiguration.ignoreQuery = true

        let session = mockConfiguration.mockAPIResponse()

        let expectation = self.expectation(description: "The correct endpoint was called")
        guard let expectedJSON = try? JSON(data: TestData.biketownDataJSON.data) else { XCTFail("Failed to parse test JSON"); return }

        let client = ScooterClient(
            sessionManager: session,
            serviceLocatorURL: ServiceLocator.biketownConfig()
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
    
    func testFetchBiketownOnError() {
        let mockConfiguration = MockConfiguration.init()
        mockConfiguration.setStatusCode(400)
        mockConfiguration.setError("Bad Request")
        mockConfiguration.setDataResponse(TestData.biketownDataJSON.data)
        mockConfiguration.setAPIURL(ServiceLocator.biketownConfig())
        mockConfiguration.ignoreQuery = true

        let session = mockConfiguration.mockAPIResponse()
        
        let expectation = self.expectation(description: "onError handler called")
        let client = ScooterClient(
            sessionManager: session,
            serviceLocatorURL: ServiceLocator.biketownConfig()
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
    
    func testFetchBiketownInformationOnSuccess() {
        let mockConfiguration = MockConfiguration.init()
        mockConfiguration.setStatusCode(200)
        mockConfiguration.setDataResponse(TestData.biketownInformationDataJSON.data)
        mockConfiguration.setAPIURL(ServiceLocator.biketownInformationConfig())
        mockConfiguration.ignoreQuery = true

        let session = mockConfiguration.mockAPIResponse()

        let expectation = self.expectation(description: "The correct endpoint was called")
        guard let expectedJSON = try? JSON(data: TestData.biketownInformationDataJSON.data) else { XCTFail("Failed to parse test JSON"); return }

        let client = ScooterClient(
            sessionManager: session,
            serviceLocatorURL: ServiceLocator.biketownInformationConfig()
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
    
    func testFetchBiketownInformationOnError() {
        let mockConfiguration = MockConfiguration.init()
        mockConfiguration.setStatusCode(400)
        mockConfiguration.setError("Bad Request")
        mockConfiguration.setDataResponse(TestData.biketownInformationDataJSON.data)
        mockConfiguration.setAPIURL(ServiceLocator.biketownInformationConfig())
        mockConfiguration.ignoreQuery = true

        let session = mockConfiguration.mockAPIResponse()
        
        let expectation = self.expectation(description: "onError handler called")
        let client = ScooterClient(
            sessionManager: session,
            serviceLocatorURL: ServiceLocator.biketownInformationConfig()
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
    
    func testFetchBiketownStatusOnSuccess() {
        let mockConfiguration = MockConfiguration.init()
        mockConfiguration.setStatusCode(200)
        mockConfiguration.setDataResponse(TestData.biketownStatusDataJSON.data)
        mockConfiguration.setAPIURL(ServiceLocator.biketownStatusConfig())
        mockConfiguration.ignoreQuery = true

        let session = mockConfiguration.mockAPIResponse()

        let expectation = self.expectation(description: "The correct endpoint was called")
        guard let expectedJSON = try? JSON(data: TestData.biketownStatusDataJSON.data) else { XCTFail("Failed to parse test JSON"); return }

        let client = ScooterClient(
            sessionManager: session,
            serviceLocatorURL: ServiceLocator.biketownStatusConfig()
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
    
    func testFetchBiketownStatusOnError() {
        let mockConfiguration = MockConfiguration.init()
        mockConfiguration.setStatusCode(400)
        mockConfiguration.setError("Bad Request")
        mockConfiguration.setDataResponse(TestData.biketownStatusDataJSON.data)
        mockConfiguration.setAPIURL(ServiceLocator.biketownStatusConfig())
        mockConfiguration.ignoreQuery = true

        let session = mockConfiguration.mockAPIResponse()
        
        let expectation = self.expectation(description: "onError handler called")
        let client = ScooterClient(
            sessionManager: session,
            serviceLocatorURL: ServiceLocator.biketownStatusConfig()
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
