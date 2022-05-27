//
//  DataLoader.swift
//  ESS
//
//  Created by wido technologies on 27/05/22.
//

import Foundation


public class DataLoader {
    
    @Published var eventData = [EventsData]()
    
    init() {
        load()
    }
    
    func load() {
    
        if let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json") {
            
            //do catch incase of error
            
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([EventsData].self, from: data)
                
                self.eventData = dataFromJson
                
            } catch {
                print(error)
            }
            
        }
    }
}
