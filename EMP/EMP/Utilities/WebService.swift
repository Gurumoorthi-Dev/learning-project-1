//
//  WebService.swift
//  EMP
//
//  Created by gurumoorthi on 08/08/22.
//

import Foundation


class WebService {
    
    typealias CompletionHandler = (_ success: Bool, _ data: Employess) -> Void
    static func getData(completionHandler: @escaping CompletionHandler) {
        var request = URLRequest(url: URL(string: "http://www.mocky.io/v2/5d565297300000680030a986")!)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(Employess.self, from: data!)
                completionHandler(true, responseModel)
            } catch {
                completionHandler(false, Employess())
            }
        }).resume()
    }
    
}


