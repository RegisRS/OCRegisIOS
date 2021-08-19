//
//  ImagemTexto.swift
//  OCRegisIOS
//
//  Created by Admin on 26/07/21.
//

import SwiftUI
import Vision


struct ImagemTexto {

    var imagemUI: UIImage?
    
    var textoIdentificado: String {
        var textoDetectado: String?
        if let imagemCG = imagemUI?.cgImage {
            // Create a new image-request handler.
            let requestHandler = VNImageRequestHandler(cgImage: imagemCG)
            
            // Create a new request to recognize text.
            let request = VNRecognizeTextRequest { request, error in
                guard let observations = request.results as? [VNRecognizedTextObservation] else {
                    return
                }
                
                let recognizedStrings = observations.compactMap { observation in
                    // Return the string of the top VNRecognizedText instance.
                    return observation.topCandidates(1).first?.string
                }
                textoDetectado = recognizedStrings.joined(separator: "\n")
            }
            
            do {
                // Perform the text-recognition request.
                try requestHandler.perform([request])
            } catch {
                print("Unable to perform the requests: \(error).")
            }
        }
        
        if textoDetectado == "" {
            textoDetectado = "Nenhum texto encontrado"
        }
        
        return textoDetectado ?? "Nenhum texto encontrado"
    }
}




