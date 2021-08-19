//
//  ContentView.swift
//  OCRegisIOS
//
//  Created by Admin on 23/07/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Propriedades
    @ObservedObject var ocrVM = OCRVM()
    

    //MARK: - Corpo
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .center) {
                Button(action: {
                     ocrVM.imagemOCR.imagemUI = UIPasteboard.general.image
                }, label: {
                    HStack {
                        Image(systemName: "plus.circle")
                        Text("Adiciona Imagem")
                    }
                })
                .padding()
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .cornerRadius(8)

                Divider()
                
                Image(uiImage: ocrVM.imagemOCR.imagemUI ?? UIImage())
                    .resizable()
                    .scaledToFit()
               
                Spacer()
                
            }//VStack
            .padding()
            
            
            Divider()
            TextEditor(text: .constant(ocrVM.imagemOCR.textoIdentificado))
                .padding()
                .font(.title)
        }//HStack
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
    }
}
