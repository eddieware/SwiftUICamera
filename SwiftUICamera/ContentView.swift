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
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var image: UIImage?
    
    var body: some View {
        NavigationView{
            VStack{
                Image(uiImage: image ?? UIImage(named: "placeholder")!) //setea imagen seleccionada else place holder default
                .resizable()
                    .frame(width: 300, height: 300)
                
                Button("Elegir Foto"){
                    self.showSheet = true // la hacemos verdadera para que cuando se pulse el boton inicie la accion del siguiente codigo
                    
                }.padding()
                    //El action sheet es accionado por el boton con la variable showSheet y es menu acendente
                    .actionSheet(isPresented: $showSheet) {
                        ActionSheet(title:Text("Seleccionar una foto"), message: Text("Elegir"), buttons: [.default(Text("Galeria de fotos")){
                            // misma logica para el Image picker
                            //fuente imagen galeria
                            self.showImagePicker = true
                            self.sourceType = .photoLibrary
                            },
                            .default(Text("Camara")){
                                //fuente de la imagen camara
                                self.showImagePicker = true
                                self.sourceType = .camera
                                
                            },
                            .cancel() //opcion cancelar del action sheet
                        ])
                }
                
            }.navigationBarTitle("Camara Lasalle Demo")//FN Vstack
            
        }.sheet(isPresented: $showImagePicker){//FN Nav
            // seccion para mostrar la funcion de los botones ya se galeria o camara aqui se llamaran las funciones
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType) //funcion para acceder a la galeria
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
