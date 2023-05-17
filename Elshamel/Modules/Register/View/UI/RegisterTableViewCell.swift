//
//  RegisterTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 29/12/2022.
//

import UIKit

enum Position {
    case student
    case teacher
}

protocol SelectPositionProtocol: AnyObject {
    func didPositionSelect(_ position: Position)
}

protocol RegisterTableViewCellDelegate: AnyObject {
    func backToLogin()
    func register(name: String, email: String, password: String, confirmPass: String, phone: String, gender: String, gradeID: Int)
//    func setGener(with gender:String)
//    func setPosition(with position:String)
}

protocol TeacherRegister {
    func teacherRegister(name: String, email: String, password: String, confirmPass: String, phone: String, gender: String, materialID: Int)
}

class RegisterTableViewCell: UITableViewCell {

    
    @IBOutlet weak var newRegisterLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var studentButton: UIButton!
    @IBOutlet weak var teacherButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var educationalLevelTextField: UITextField!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var conditionsLabel: UILabel!
    @IBOutlet weak var haveAccountLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var educationalLevelButton: UIButton!
    
   // var loginBtnClicked: (()->())?
    weak var delegate: RegisterTableViewCellDelegate?
    weak var positionDelegate: SelectPositionProtocol?
    var isStudent = true
    var isMale = true
    var gender = "Male"
    var gradeId: Int?
    var teacherDelegate: TeacherRegister?
    var materialID: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpTxt()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.contentView.endEditing(true)
    }
    
    func setUpTxt() {
        registerButton.layer.cornerRadius = 15
        nameTextField.layer.borderColor = UIColor.white.cgColor
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.cornerRadius = 10
        emailTextField.layer.borderColor = UIColor.white.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 10
        confirmPasswordTextField.layer.borderColor = UIColor.white.cgColor
        confirmPasswordTextField.layer.borderWidth = 1
        confirmPasswordTextField.layer.cornerRadius = 10
        phoneNumberTextField.layer.borderColor = UIColor.white.cgColor
        phoneNumberTextField.layer.borderWidth = 1
        phoneNumberTextField.layer.cornerRadius = 10
        educationalLevelTextField.layer.borderColor = UIColor.white.cgColor
        educationalLevelTextField.layer.borderWidth = 1
        educationalLevelTextField.layer.cornerRadius = 10
        educationalLevelTextField.isEnabled = false
    }
    
    @IBAction func regissterButton(_ sender: Any) {
        if isStudent {
            guard let name = nameTextField.text else { return }
            guard let email = emailTextField.text else { return }
            guard let password = passwordTextField.text else { return }
            guard let confirmPass = confirmPasswordTextField.text else { return }
            guard let phone = phoneNumberTextField.text else { return }
            guard let gradeId = gradeId else { return }
            delegate?.register(name: name, email: email, password: password, confirmPass: confirmPass, phone: phone, gender: gender, gradeID: gradeId)
        } else {
            guard let name = nameTextField.text else { return }
            guard let email = emailTextField.text else { return }
            guard let password = passwordTextField.text else { return }
            guard let confirmPass = confirmPasswordTextField.text else { return }
            guard let phone = phoneNumberTextField.text else { return }
            guard let materialID = materialID else { return }
            teacherDelegate?.teacherRegister(name: name, email: email, password: password, confirmPass: confirmPass, phone: phone, gender: gender, materialID: materialID)
        }
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        //loginBtnClicked?()
        delegate?.backToLogin()
    }
    
    func config(with position: Position) {
        if position == .student {
            educationalLevelTextField.placeholder = "المرحلة الدراسية*"
            var actions: [UIAction] = []
            guard let grades = AppData.shared.grades else { return }
            for grade in grades {
                let item = UIAction(title: (grade.name)!) { _ in
                    self.educationalLevelTextField.text = grade.name
                    self.gradeId = grade.id
                }
                actions.append(item)
            }
            let captionMenu = UIMenu(title: "", children: actions)
            educationalLevelButton.menu = captionMenu
            educationalLevelButton.showsMenuAsPrimaryAction = true
            
        } else { // will be teacher position
            educationalLevelTextField.placeholder = "المادة الدراسية *"
            var actions: [UIAction] = []
            guard let materials = AppData.shared.materials else { return }
            for material in materials {
                let item = UIAction(title: (material.name)!) { _ in
                    self.educationalLevelTextField.text = material.name
                    self.materialID = material.id
                }
                actions.append(item)
            }
            let captionMenu = UIMenu(title: "", children: actions)
            educationalLevelButton.menu = captionMenu
            educationalLevelButton.showsMenuAsPrimaryAction = true
        }
    }
//    func config(name: String, email: String, password: String, confirmPass: String, phone: String, educationalLevel: String) {
//        nameTextField.text = name
//        emailTextField.text = email
//        passwordTextField.text = password
//        confirmPasswordTextField.text = confirmPass
//        phoneNumberTextField.text = phone
//        educationalLevelTextField.text = educationalLevel
//    }
    
    @IBAction func teacherBtn(_ sender: Any) {
        teacherButton.setImage(UIImage(named: "mark 1"), for: .normal)
        studentButton.setImage(UIImage(named: "mark"), for: .normal)
        positionDelegate?.didPositionSelect(.teacher)
    }
    
    @IBAction func studentBtn(_ sender: Any) {
        studentButton.setImage(UIImage(named: "mark 1"), for: .normal)
        teacherButton.setImage(UIImage(named: "mark"), for: .normal)
        positionDelegate?.didPositionSelect(.student)
    }
    
    @IBAction func maleBtn(_ sender: Any) {
        maleButton.setImage(UIImage(named: "mark 1"), for: UIControl.State.normal)
        femaleButton.setImage(UIImage(named: "mark"), for: .normal)
        isMale = true
        if isMale == true {
            gender = "Male"
        }
    }
    
    @IBAction func femaleBtn(_ sender: Any) {
        femaleButton.setImage(UIImage(named: "mark 1"), for: .normal)
        maleButton.setImage(UIImage(named: "mark"), for: UIControl.State.normal)
        isMale = false
        if isMale == false {
            gender = "Female"
        }
    }
    
//    @IBAction func educationalLevelBtn(_ sender: Any) {
//        if isStudent {
//            var actions: [UIAction] = []
//            for grade in (LogedInUser.shared.grades)! {
//                let item = UIAction(title: (grade.name)!) { _ in
//                    self.educationalLevelTextField.text = grade.name
//                    self.gradeId = grade.id
//                }
//                actions.append(item)
//            }
//            let captionMenu = UIMenu(title: "", children: actions)
//            educationalLevelButton.menu = captionMenu
//            educationalLevelButton.showsMenuAsPrimaryAction = true
//
//        } else {
//            var actions: [UIAction] = []
//            for material in (LogedInUser.shared.grades)! {
//                let item = UIAction(title: (material.name)!) { _ in
//                    self.educationalLevelTextField.text = material.name
//                    self.materialID = material.id
//                }
//                actions.append(item)
//            }
//            let captionMenu = UIMenu(title: "", children: actions)
//            educationalLevelButton.menu = captionMenu
//            educationalLevelButton.showsMenuAsPrimaryAction = true
//        }
//    }
    
}
