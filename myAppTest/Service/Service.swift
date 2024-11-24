//
//  Service.swift
//  myAppTest
//
//  Created by Ana Carolina on 23/11/24.
//

import Foundation

final class Service {
    func getDataForPage(page: Int, completion: @escaping (PageData) -> ()) {
        guard page >= 1 else { return }
        
        if let url = URL(string: "http://www.omdbapi.com/?s=Batman&page=\(page)&apikey=eeefc96f") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode(PageData.self, from: data)
                        
                        DispatchQueue.main.async {
                            completion(result)
                        }
                    } catch let error {
                        debugPrint(error)
                    }
                }
            }.resume()
        }
    }
}
