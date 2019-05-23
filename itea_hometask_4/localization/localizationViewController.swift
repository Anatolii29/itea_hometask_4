//
//  studentLoginViewController.swift
//  itea_hometask_4
//
//  Created by Anatolii on 5/15/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class localizationViewController: UIViewController {
    
    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var studentFamilyTextField: UITextField!
    @IBOutlet weak var studentAgeTextField: UITextField!
    @IBOutlet weak var studentCityTextField: UITextField!
    @IBOutlet weak var studentCourseTextField: UITextField!
    @IBOutlet weak var studentPhotoTextField: UITextField!
   
    var outletsDictionary: [String: UITextField] = [:]
    var arrayOfEmptyFields: [String] = []
    var student: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outletsDictionary.updateValue(studentNameTextField, forKey: "Имя")
        outletsDictionary.updateValue(studentFamilyTextField, forKey: "Фамилия")
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
            var textAlert = NSLocalizedString("", comment: "")
            switch typeOfMessage {
            case 0:
                textAlert.append(NSLocalizedString("Не заполнены поля: ", comment: ""))
                for field in arrayOfEmptyFields {
                    textAlert.append(NSLocalizedString("\(field)", comment: ""))
                    textAlert.append(" ")
                }
            case 1:
                textAlert.append(NSLocalizedString("Поле возраст не соответствует числу", comment: ""))
            default:
                textAlert.append("")
            }
            
            let alertTitle = NSLocalizedString("Внимание", comment: "")
            let alertMessage = NSLocalizedString(textAlert, comment: "")
            let OkButtonText = NSLocalizedString("OK", comment: "")
            let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
            let OkAction = UIAlertAction(title: OkButtonText, style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(OkAction)
            self.present(alert, animated: false, completion: nil)
        }
        arrayOfEmptyFields.removeAll()
    }
    
    func addStudent() {
         student = Student(name: studentNameTextField.text!,
                              surname: studentFamilyTextField.text!,
                              age: Int(studentAgeTextField.text!)!,
                              city: studentCityTextField.text!,
                              course: studentCourseTextField.text!,
                              photo: studentPhotoTextField.text!)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if !fieldsIsEmpty() {
            addStudent()
            let vc = storyboard?.instantiateViewController(withIdentifier: "studentDetailsViewController") as! studentDetailsViewController
            vc.student = student
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
