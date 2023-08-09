//
//  Bundle-Decodable.swift
//  MoonShot
//
//  Created by Asghar on 8/4/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to loacte \(file) in Bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load \(file) from Bundle.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        
        guard let loaded =  try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode \(file) from Bundle.")
        }
        
        return loaded
    }
}
