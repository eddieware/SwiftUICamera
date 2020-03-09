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
    @Binding var isShown: Bool
    
    init(image: Binding<UIImage?>, isShown: Binding<Bool>){
        _image = image
        _isShown = isShown
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{ // EL as! SE CAMBIO A as? porque regresara un nullable object
            image = uiImage
            isShown = false
            
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
    
}

struct ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = ImagePickerCoordinator
    //
    @Binding var image: UIImage?
    @Binding var isShown: Bool
    var sourceType: UIImagePickerController.SourceType = .camera
    
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        //para actualizar el vire controller
        
    }
    
    func makeCoordinator() ->ImagePicker.Coordinator {
        //some here
        return ImagePickerCoordinator(image: $image, isShown: $isShown) // le pasamos image para que regrese bindeable image
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        //el contexto UIViewControllerRepresentableContext<ImagePicker>) retorna = -> = UIImagePickerController
        let picker = UIImagePickerController()
        picker.sourceType =  sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
}
