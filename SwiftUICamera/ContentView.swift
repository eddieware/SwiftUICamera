//
//  ContentView.swift
//  SwiftUICamera
//
//  Created by EDUARDO MEJIA on 09/03/20.
//  Copyright © 2020 EDDIEWARE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet: Bool =  false
    
    var body: some View {
        NavigationView{
            VStack{
                Image("placeholder")
                .resizable()
                    .frame(width: 300, height: 300)
                
                Button("Choose Picture"){
                    self.showSheet = true // la hacemos verdadera para que cuando se pulse el boton inicie la accion del siguiente codigo
                    
                }.padding()
                    //El action sheet es accionado por el boton con la variable showSheet y es menu acendente
                    .actionSheet(isPresented: $showSheet) {
                        ActionSheet(title:Text("Seleccionar una foto"), message: Text("Elegir"), buttons: [.default(Text("Galeria de fotos")){
                            //
                            },
                            .cancel()
                        ])
                }
                
            }.navigationBarTitle("Camara Lasalle Demo")//FN Vstack
            
        }//FN Nav
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
