//
//  BookViewController.swift
//  BookCollector
//
//  Created by Bryan Hayes on 10/1/17.
//  Copyright © 2017 ZappyCode. All rights reserved.
//

import UIKit

class BookViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        

    }
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        bookImageView.image = image
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let book = Book(context: context)
        book.title = titleTextField.text
        book.image = UIImagePNGRepresentation(bookImageView.image!) as NSData!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
}