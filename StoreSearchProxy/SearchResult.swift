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

class SearchResult:Codable, CustomStringConvertible {
    
    var kind : String?
    
    var artistName = ""

    var trackName : String?
    var trackPrice : Double?
    var trackViewUrl:String?

    var collectionName:String?
    var collectionViewUrl:String?
    var collectionPrice:Double?
    
    var itemPrice:Double?
    var itemGenre:String?
    var bookGenre:[String]?
    
    var currency = ""
    var imageSmall = ""
    var imageLarge = ""

    var name : String {
        return trackName ?? collectionName ?? ""
    }
    var description : String {
        return "Kind: \(kind ?? ""), Name: \(name), Artist Name: \(artistName)\n"
    }

    var storeURL : String {
        return trackViewUrl ?? collectionViewUrl ?? ""
    }
    
    var price : Double {
        return trackPrice ?? collectionPrice ?? itemPrice ?? 0.0
    }
    
    var genre : String {
        if let genre = itemGenre {
            return genre
        } else if let genres = bookGenre {
            return genres.joined(separator: ", ")
        }
        return ""
    }
    
    enum CodingKeys : String, CodingKey {
        case imageSmall = "artworkUrl60"
        case imageLarge = "artworkUrl100"
        case itemGenre = "primaryGenreName"
        case bookGenre = "genres"
        case itemPrice = "price"
        case kind, artistName, currency
        case trackName, trackPrice, trackViewUrl
        case collectionName, collectionViewUrl, collectionPrice
    }
    
    var type:String {
        let kind = self.kind ?? "audiobook"
        switch kind {
        case "album": return "Album"
        case "audiobook": return "Audio Book"
        case "book": return "Book"
        case "ebook": return "E-Book"
        case "feature-movie": return "Movie"
        case "music-video": return "Music Video"
        case "podcast": return "Podcast"
        case "software": return "App"
        case "song": return "Song"
        case "tv-episode": return "TV Episode"
        default: break
        }
        return "Unknown"
    }
}

func < (lhs : SearchResult, rhs : SearchResult) -> Bool {
    return lhs.name.localizedStandardCompare(rhs.name) == .orderedAscending
}



