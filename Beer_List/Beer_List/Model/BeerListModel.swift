//
//  BeerListModel.swift
//  Beer_List
//
//  Created by DohyunKim on 2021/03/26.
//

import Foundation



struct BeerListModel: Codable {
    
    var id: Int?
    var name: String?
    var tagline: String?
    var first_brewed: String?
    var description: String?
    var image_url: String?
    var abv: Double?
    var ibu: Int?
    var target_fg: Int?
    var target_og: Int?
    var ebc: Int?
    var srm: Int?
    var ph: Double?
    var attenuation_level: Int?
    var volume: Volume?
    var boil_volume: Boil_Volume?
    var method: Method?
    var fermentation: Fermentation?
    var ingredients: Ingredients?
    var food_pairing: Array<String>?
    var brewers_tips: String?
    var contributed_by: String?

}

struct Volume: Codable {
    var value: Int?
    var unit: String?
}

struct Boil_Volume: Codable {
    var value: Int?
    var unit: String?
}

struct Method: Codable {
    var mash_temp: Temp?
    var duration: Int?
}

struct Temp: Codable {
    var value: Int?
    var unit: String?
}

struct Fermentation: Codable {
    var temp: Temp?
    var twist: String
}

struct Ingredients: Codable {
    var malt: Malt?
    var hops: Array<Hops>?
    var yeast: String?
    
}

struct Malt: Codable {
    var name: String?
    var amount: Amount?
}

struct Amount: Codable {
    var value: Int?
    var unit: String?
}

struct Hops: Codable {
    var name: String?
    var amount: Amount?
    var add: String?
    var attribute: String?
    
}





