//
//  JsonParser.swift
//  homework2-6
//
//  Created by Dariya on 13/1/24.
//

import Foundation

struct JsonParser {
    
    let decoder = JSONDecoder()
    
    func getStudent(completion: @escaping ([Student]) -> Void) {
        if let path = Bundle.main.path(forResource: "Students", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let studens = try decoder.decode([Student].self, from: data)
                completion(studens)
            } catch {
                print(error)
            }
        }
    }
}
