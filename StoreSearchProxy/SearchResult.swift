//
//  SearchResult.swift
//  StoreSearchProxy
//
//  Created by Marvin Do on 7/12/18.
//  Copyright © 2018 Marvin Do. All rights reserved.
//

import Foundation

class ResultArray : Codable {
    var resultCount = 0
    var results = [SearchResult]()
}

class SearchResult : Codable, CustomStringConvertible {

    var artistName = ""
    var trackName = ""

    var name : String {
        return trackName
    }
    var description : String {
        return "Name: \(name), Artist Name: \(artistName)"
    }
    
}
