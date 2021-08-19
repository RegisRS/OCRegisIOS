//
//  OCRVM.swift
//  OCRegisIOS
//
//  Created by Admin on 27/07/21.
//

import SwiftUI

class OCRVM: ObservableObject {
    //@Published var imagemOCR = ImagemTexto(imagemUI: UIImage(named: "Image-1")!)
    
    @Published var imagemOCR: ImagemTexto
    
    init() {
        self.imagemOCR = ImagemTexto(imagemUI: UIImage(named: "Image-1")!)
    }
}
