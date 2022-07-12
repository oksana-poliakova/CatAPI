//
//  Breed.swift
//  CatAPI
//
//  Created by Oksana Poliakova on 12.07.2022.
//

import Foundation

// MARK: - BreedElement
struct BreedElement: Codable {
    let weight: Weight?
    let id: String?
    let name: String?
    let cfaURL: String?
    let vetstreetURL: String?
    let vcahospitalsURL: String?
    let temperament: String?
    let origin: String?
    let countryCodes: String?
    let countryCode: String?
    let breedDescription: String?
    let lifeSpan: String?
    let indoor: Int?
    let lap: Int?
    let altNames: String?
    let adaptability: Int?
    let affectionLevel: Int?
    let childFriendly: Int?
    let dogFriendly: Int?
    let energyLevel: Int?
    let grooming: Int?
    let healthIssues: Int?
    let intelligence: Int?
    let sheddingLevel: Int?
    let socialNeeds: Int?
    let strangerFriendly: Int?
    let vocalisation: Int?
    let experimental: Int?
    let hairless: Int?
    let natural: Int?
    let rare: Int?
    let rex: Int?
    let suppressedTail: Int?
    let shortLegs: Int?
    let wikipediaURL: String?
    let hypoallergenic: Int?
    let referenceImageID: String?
    let image: Image?
    let catFriendly: Int?
    let bidability: Int?

    enum CodingKeys: String, CodingKey {
        case weight = "weight"
        case id = "id"
        case name = "name"
        case cfaURL = "cfa_url"
        case vetstreetURL = "vetstreet_url"
        case vcahospitalsURL = "vcahospitals_url"
        case temperament = "temperament"
        case origin = "origin"
        case countryCodes = "country_codes"
        case countryCode = "country_code"
        case breedDescription = "description"
        case lifeSpan = "life_span"
        case indoor = "indoor"
        case lap = "lap"
        case altNames = "alt_names"
        case adaptability = "adaptability"
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case grooming = "grooming"
        case healthIssues = "health_issues"
        case intelligence = "intelligence"
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case vocalisation = "vocalisation"
        case experimental = "experimental"
        case hairless = "hairless"
        case natural = "natural"
        case rare = "rare"
        case rex = "rex"
        case suppressedTail = "suppressed_tail"
        case shortLegs = "short_legs"
        case wikipediaURL = "wikipedia_url"
        case hypoallergenic = "hypoallergenic"
        case referenceImageID = "reference_image_id"
        case image = "image"
        case catFriendly = "cat_friendly"
        case bidability = "bidability"
    }
}

// MARK: - Image
struct Image: Codable {
    let id: String?
    let width: Int?
    let height: Int?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case width = "width"
        case height = "height"
        case url = "url"
    }
}

// MARK: - Weight
struct Weight: Codable {
    let imperial: String?
    let metric: String?

    enum CodingKeys: String, CodingKey {
        case imperial = "imperial"
        case metric = "metric"
    }
}

typealias Breed = [BreedElement]
