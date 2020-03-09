//
//  ImagePicker.swift
//  SwiftUICamera
//
//  Created by EDUARDO MEJIA on 09/03/20.
//  Copyright © 2020 EDDIEWARE. All rights reserved.
//

import Foundation
import SwiftUI

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //clase declarada para inicializar el binding image
    @Binding var image: UIImage?
    
    init(image: Binding<UIImage?>){
        _image = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{ // EL as! SE CAMBIO A as? porque regresara un nullable object
            image = uiImage
            
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = ImagePickerCoordinator
    //
    @Binding var image: UIImage?
    var sourceType: UIImagePickerController.SourceType = .camera
    
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        //para actualizar el vire controller
        
    }
    
    func makeCoordinator() ->ImagePicker.Coordinator {
        //some here
        return ImagePickerCoordinator(image: $image) // le pasamos image para que regrese bindeable image
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        //el contexto UIViewControllerRepresentableContext<ImagePicker>) retorna = -> = UIImagePickerController
        let picker = UIImagePickerController()
        picker.sourceType =  sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
}
