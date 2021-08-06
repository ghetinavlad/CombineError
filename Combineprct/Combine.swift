//
//  File.swift
//  File
//
//  Created by Wolfpack Digital on 06.08.2021.
//

import Foundation
import Combine


class API
{
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        
    func fetchUsers() -> AnyPublisher<[User], Never>{
        guard let url = url else{
            return Just([])
                .eraseToAnyPublisher()
        }
        
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: [User].self, decoder:JSONDecoder())
            .catch({_ in
                Just([])
            })
            .eraseToAnyPublisher()
            
            return publisher
    }
}
