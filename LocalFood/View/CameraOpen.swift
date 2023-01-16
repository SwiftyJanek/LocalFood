//
//  CameraOpen.swift
//  LocalFood
//
//  Created by Janek Behrens on 16.01.23.
//

import SwiftUI

struct CameraOpen: UIViewControllerRepresentable {
    @Binding var showImagePicker: Bool

    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraOpen>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CameraOpen>) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: CameraOpen

        init(_ parent: CameraOpen) {
            self.parent = parent
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.showImagePicker = false
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // Do something with the selected image
            parent.showImagePicker = false
        }
    }
}
