//
//  JuegosViewController.swift
//  saraiColeccionDeJuegos
//
//  Created by sarai choqquepata tapia on 2/10/24.
//

import UIKit

class JuegosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    @IBAction func fotosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true,
                completion: nil)
    }
    
    @IBAction func camaraTapped(_ sender: Any) {
    }
    
    @IBAction func agregarTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
           let juego = Juego(context: context)
           juego.titulo = tituloTextField.text
           juego.imagen = JuegoImageView.image?.jpegData(compressionQuality: 0.50)
           (UIApplication.shared.delegate as! AppDelegate).saveContext()
           navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var tituloTextField: UITextField!
    
    @IBOutlet weak var JuegoImageView: UIImageView!
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagenSeleccionada = info[.originalImage] as? UIImage
        JuegoImageView.image = imagenSeleccionada
        imagePicker.dismiss(animated: true, completion: nil)
    }


}
