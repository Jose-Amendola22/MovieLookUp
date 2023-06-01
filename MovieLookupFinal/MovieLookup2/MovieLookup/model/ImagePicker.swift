import SwiftUI
import UIKit

 

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: Image?

 

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

 

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator // Establece el coordinador como delegado del picker
        return picker
    }

 

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

 

    }

 

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

 

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

 

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = Image(uiImage: uiImage) // Asigna la imagen seleccionada a la variable image del padre
            }

 

            parent.presentationMode.wrappedValue.dismiss() // Cierra el ImagePicker
        }

 

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss() // Cierra el ImagePicker si el usuario cancela la selección
        }
    }
}
