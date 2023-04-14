//
//  NetworkManager.swift
//  SelfService
//
//  Created by Imac on 7/9/20.
//  Copyright © 2020 IbnSinai. All rights reserved.
//

import Alamofire
import Foundation
import Reachability

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    fileprivate var reachability: Reachability?
    
    fileprivate func getimageData(images: [UIImage], compRatio: CGFloat) -> [Data] {
        var data = [Data]()
        for image in images {
            if let imageData = image.jpegData(compressionQuality: compRatio) {
                data.append(imageData)
            } else {
                print("faild to get image")
            }
        }
        return data
    }
    
    func isInternetAvailable() -> Bool {
        return (NetworkReachabilityManager()?.isReachable)!
    }
}

// MARK: - process api reqest

extension NetworkManager {
    func processReq<T: Codable>(url: EndPointUrls, method: HTTPMethod, bodyParams:[String:String]? = nil, returnType: T.Type, headers: [String: String]? = nil, params: Alamofire.Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, completionHandler: @escaping (Swift.Result<T?, NetWorkError>) -> Void) {

        if isInternetAvailable() {
            let params = method == .post ? nil : bodyParams
            let fullUrl = NetworkManager.shared.getFullUrl(baseUrl: BasUrls.base, endPoint: url, parameters: params)

            var request = URLRequest(url: URL(string: fullUrl)!,timeoutInterval: 60)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
//            if let headers = headers {
//                let headerDictionary = Dictionary(uniqueKeysWithValues: headers.map { ($0.0, $0.1) })
//                for (key, value) in headerDictionary {
//                    request.addValue(value, forHTTPHeaderField: key)
//                }
//            }
            let v4apiKey = "222|WZKs8BeubiG0McFonUtMhSfduEU3ueps5wcLMEJR"
            request.setValue("Bearer \(v4apiKey)", forHTTPHeaderField: "Authentication")
            do {
                if let parameterList = bodyParams, method == .post {
                    request.httpBody = try JSONSerialization.data(withJSONObject: parameterList)
                }
            } catch let error {
                print(error.localizedDescription)
            }

            request.httpMethod = method.rawValue
            URLSession.shared.dataTask(with: request) { data, response, error in

                if self.checkStatusCode400(from: data) {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationCenterKeys.logout.rawValue),
                                                    object: nil,
                                                    userInfo: nil)
                }

                guard let data = data else {

                    completionHandler(.failure(.init(errorType: .serverError)))
                    print(String(describing: error))
                    return
                }
                print(String(data: data, encoding: .utf8)!)
                if let response = try? JSONDecoder().decode(T.self, from: data){
                    completionHandler(.success(response))
                }else{
                    completionHandler(.failure(.init(errorType: .couldNotParseJson)))
                }

            }.resume()

        } else {
            completionHandler(.failure(.init(errorType: .noInternet)))
        }
    }
    
    private func checkStatusCode400(from data:Data?) -> Bool {
        do {
            if let responseData = data {
                let json = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String:AnyObject]
                if let statusCode = json?["status_code"] as? Int, statusCode == 401 {
                    return true
                }
            }
        }catch { return false }
        return false
    }
}

// MARK: - parse response JSON

extension NetworkManager {
    fileprivate func parseResponse<T: Codable>(data: Data?, returnType: T.Type, completionHandler: @escaping (Swift.Result<T?, NetWorkError>) -> Void) {
        if let _ = data {
            do {
                let str = String(decoding: data!, as: UTF8.self)
                NSLog("%@", str)
                let response = try JSONDecoder().decode(T.self, from: data!)
                completionHandler(.success(response))
            } catch {
                completionHandler(.failure(.init(errorType: .couldNotParseJson)))
            }
        }
    }
}

extension NetworkManager {
    func setupInternetConnectionListener() {
        if reachability != nil {
            reachability?.stopNotifier()
            reachability = nil
        }
        reachability = try! Reachability()
        reachability?.whenReachable = { _ in
            // TODO: To be used to check with firebase
        }
        reachability?.whenUnreachable = { _ in
            print("Not reachable")
        }
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
}

extension NetworkManager {
    func getFullUrl(baseUrl: String, endPoint: EndPointUrls, parameters: [String: String]? = nil) -> String {
        let urlString = "\(baseUrl)\(endPoint.rawValue)"
        var components = URLComponents()
        components.path = urlString
        components.queryItems = []
        if let params = parameters {
            for key in params.keys {
                components.queryItems?.append(URLQueryItem(name: key, value: params[key]!))
            }
            //return (components.url?.absoluteString.removingPercentEncoding?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? urlString)
        }
        return urlString
    }
}
