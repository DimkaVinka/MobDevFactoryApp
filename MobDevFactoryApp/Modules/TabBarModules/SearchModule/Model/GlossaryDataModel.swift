//
//  GlossaryDataModel.swift
//  MobDevFactoryApp
//
//  Created by Elena Noack on 07.10.22.
//

import Foundation

struct GlossaryDataModel: Decodable {
    let title: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
    case title, description
    }
}
