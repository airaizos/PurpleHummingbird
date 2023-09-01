//
//  URLRequestExtensions.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 13/4/23.
//

import Foundation

public extension URLRequest {
    
    static func get(url:URL, token:String? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        
   
        request.timeoutInterval = 30
        request.httpMethod = HTTPMethods.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        if let token {
            request.setValue("Beared \(token)", forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
    
    static func post<JSON:Codable>(url:URL,data:JSON, method:HTTPMethods = .post, token:String? = nil) -> URLRequest {
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 30
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(data)
        
        if let token {
            request.setValue("Beared \(token)", forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
    
    //??
    static func put<JSON:Codable>(url:URL,data:JSON, method:HTTPMethods = .put) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 30
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(data)
        return request
    }
    
    static func patch<JSON:Codable>(url:URL,data:JSON, method:HTTPMethods = .patch) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 30
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(data)
        return request
    }
    
    static func delete<JSON:Codable>(url:URL,data:JSON, method:HTTPMethods = .delete) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 30
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(data)
        return request
    }
    
    public enum HTTPMethods:String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }

}
