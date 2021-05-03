//
//  ViewController.swift
//  FileManagerAppDemo
//
//  Created by Debarshee on 5/3/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fileNameTextField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var readButton: UIButton!
    @IBOutlet weak var fileTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createButtonClicked(_ sender: UIButton) {
        let fileHandler = FileHandler(fileName: fileNameTextField.text ?? "")
        let fileHasCreated = fileHandler.writeToDocuments(string: "this is my entry", filename: fileNameTextField.text ?? "")
        if fileHasCreated {
            print("worked")
        } else {
            print("Error")
        }
    }
    
    @IBAction func deleteButtonClicked(_ sender: UIButton) {
        let fileHandler = FileHandler(fileName: fileNameTextField.text ?? "")
        fileHandler.deleteDocumentsFile()
    }
    @IBAction func readButtonClicked(_ sender: UIButton) {
        let fileHandler = FileHandler(fileName: fileNameTextField.text ?? "")
        if fileHandler.readFile(at: .Documents, withName: fileNameTextField.text ?? "").isEmpty {
            fileTextView.text = "No such file"
        } else {
            fileTextView.text = fileHandler.readFile(at: .Documents, withName: fileNameTextField.text ?? "")
        }
    }
    
}

