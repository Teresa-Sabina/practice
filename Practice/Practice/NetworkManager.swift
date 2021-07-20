//
//  NetworkManager.swift
//  Practice
//
//  Created by Lourdes T S Santiago on 20/07/2021.
//

import Foundation

class NetworkManager {
 let url = "https://gist.githubusercontent.com/hart88/79a65d27f52cbb74db7df1d200c4212b/raw/ebf57198c7490e42581508f4f40da88b16d784ba/cakeList"
    func fetchData(completion: @escaping(_ cake: [Cakes]? , _ error:Error?)-> Void) {
         
        guard let url  = URL(string: url) else { return }
        let dataTask  =  URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
            let cakes = try JSONDecoder().decode([Cakes].self, from: data)
                completion(cakes, nil)
            }
            catch {
                print(error.localizedDescription)
                completion(nil, error)
            }
        }
        dataTask.resume()
    
    }
    
}



