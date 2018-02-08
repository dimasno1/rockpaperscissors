//
//  Result.swift
//  RockPaperScissors
//
//  Created by Dimasno1 on 08.02.2018.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import Foundation
import UIKit


struct ResultSaver {
    var resultDescription: String
    var imageForResult: UIImage?
    var yourSign: String
    var computerSign: String
    
    init(resultDescription: String, imageForResult: UIImage?, yourSign: String, computerSign: String) {
        
        self.resultDescription = resultDescription
        self.imageForResult = imageForResult
        self.yourSign = yourSign
        self.computerSign = computerSign
    }
    
   static var arrayOfResult = [ResultSaver]()
    
    
}
