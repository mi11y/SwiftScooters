//
//  MockConfiguration.swift
//  
//
//  Created by Milly Guitron on 3/27/22.
//
import Alamofire
import Mocker
import Foundation

class MockConfiguration {
    
    private var statusCode: Int
    private var payload: Data
    private var testError: TestAPIError?
    private var apiURL: URLComponents?
    
    init() {
        self.statusCode = 200
        self.payload = TestData.limeDataJSON.data
    }
    
    public func setStatusCode(_ statusCode: Int) -> Void {
        self.statusCode = statusCode
    }
    
    
    public func setDataResponse(_ data: Data) -> Void {
        self.payload = data
    }
    
    public func setError(_ message: String) -> Void {
        self.testError = TestAPIError.message(message)
    }
    
    public func setAPIURL(_ urlComponents: URLComponents) -> Void {
        self.apiURL = urlComponents
    }
    
    public enum TestAPIError: Error {
        case message(String)
    }
    
    public func mockAPIResponse() -> Session {
        if let urlComponents = self.apiURL {
            self.mockSessionWithComponents(urlComponents)
        }
        
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        return Alamofire.Session(configuration: configuration)
    }
    
    
    private func mockSessionWithComponents(_ urlComponenets: URLComponents) {
        let apiEndpoint = createURLFromComponents(urlComponenets)
        
        if let error = self.testError {
            Mock(
                url: apiEndpoint,
                ignoreQuery: false,
                dataType: .json,
                statusCode: self.statusCode,
                data: [
                    .get: self.payload
                ],
                requestError: error
            ).register()
        } else {
            Mock(
                url: apiEndpoint,
                ignoreQuery: false,
                dataType: .json,
                statusCode: self.statusCode,
                data: [
                    .get: self.payload
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
