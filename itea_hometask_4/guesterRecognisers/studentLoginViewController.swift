//
//  studentLoginViewController.swift
//  itea_hometask_4
//
//  Created by Anatolii on 5/15/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class studentLoginViewController: UIViewController {
    
    @IBOutlet weak var stuedentNameTextField: UITextField!
    @IBOutlet weak var studentSurnameTextField: UITextField!
    @IBOutlet weak var studentAgeTextField: UITextField!
    @IBOutlet weak var studentCityTextField: UITextField!
    @IBOutlet weak var studentCourseTextField: UITextField!
    @IBOutlet weak var studentPhotoTextField: UITextField!
    
    var outletsDictionary: [String: UITextField] = [:]
    var arrayOfEmptyFields: [String] = []
    var studentsArray: [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outletsDictionary.updateValue(stuedentNameTextField, forKey: "Имя")
        outletsDictionary.updateValue(studentSurnameTextField, forKey: "Фамилия")
        outletsDictionary.updateValue(studentCityTextField, forKey: "Город")
        outletsDictionary.updateValue(studentCourseTextField, forKey: "Курс")
        outletsDictionary.updateValue(studentPhotoTextField, forKey: "Фото")
        
    }
    
    func fieldsIsEmpty() -> Bool {
        var isEmptyFields = false
        var typeOfMessage = 0
        for element in outletsDictionary {
            if !isEmptyFields {
                isEmptyFields =  element.value.text?.isEmpty ?? true
            }
            fillArrayOfEmptyFields(text: element.key, needToAdd: element.value.text!.isEmpty)
        }
        if !(studentAgeTextField.text?.isEmpty ?? true) {
            if Int(studentAgeTextField.text ?? "") == nil {
                isEmptyFields = true
                typeOfMessage = 1
            }
        }
        else {
            isEmptyFields = true
            fillArrayOfEmptyFields(text: "Возраст", needToAdd: isEmptyFields)
        }
        showAlert(needToShow: isEmptyFields, typeOfMessage: typeOfMessage)
        return isEmptyFields
    }
    
    func fillArrayOfEmptyFields(text: String, needToAdd: Bool) {
        if needToAdd {
            arrayOfEmptyFields.append(text)
        }
    }
    
    func showAlert(needToShow: Bool, typeOfMessage: Int) {
        if needToShow {
            var textAlert = ""
            switch typeOfMessage {
            case 0:
                textAlert.append("Не заполнены поля: ")
                for field in arrayOfEmptyFields {
                    textAlert.append("\(field), ")
                }
            case 1:
                textAlert.append("Поле возраст не соответствует числу")
            default:
                textAlert.append("")
            }
            let alert = UIAlertController(title: "Внимание", message: textAlert, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: false, completion: nil)
        }
        arrayOfEmptyFields.removeAll()
    }
    
    func addStudent() {
        let student = Student(name: stuedentNameTextField.text!,
                              surname: studentSurnameTextField.text!,
                              age: Int(studentAgeTextField.text!)!,
                              city: studentCityTextField.text!,
                              course: studentCourseTextField.text!,
                              photo: studentPhotoTextField.text!)
        studentsArray.append(student)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if !fieldsIsEmpty() {
            addStudent()
            let vc = storyboard?.instantiateViewController(withIdentifier: "studentCollectionViewController") as! studentCollectionViewController
            vc.studentArray = studentsArray
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
