//
//  ViewController.swift
//  SignUpProjectWithAlert
//
//  Created by Doğa on 5.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordAgainTextField: UITextField!
    @IBOutlet weak var rememberSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextField.text = ""
        passwordTextField.text = ""
        passwordAgainTextField.text = ""

    }

    var storedUsername : String = ""
    var storedPassword : String = ""
    var storedPasswordAgain : String = ""

    override func viewWillDisappear(_ animated: Bool) {
        if rememberSwitch.isOn == true{
            UserDefaults.standard.set(true, forKey: "rememberSwitch")
        }else{
            UserDefaults.standard.set(false, forKey: "rememberSwitch")
        }
    }

    override func viewWillAppear(_ animated: Bool) {

        let switchStatus = UserDefaults.standard.bool(forKey: "rememberSwitch")

        rememberSwitch.setOn(switchStatus, animated: true)

        if(rememberSwitch.isOn){
            rememberSwitch.setOn(true, animated: true)
            storedUsername = (UserDefaults.standard.object(forKey: "username") as! String)
            storedPassword = UserDefaults.standard.object(forKey: "password") as! String
            storedPasswordAgain = UserDefaults.standard.object(forKey: "passwordAgain") as! String

            usernameTextField.text = storedUsername
            passwordTextField.text = storedPassword
            passwordAgainTextField.text = storedPasswordAgain
        }else{
            usernameTextField.text = ""
            passwordTextField.text = ""
            passwordAgainTextField.text = ""
        }
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "signInVC"{
            let destinationVC = segue.destination as! signInViewController
            destinationVC.username = "Username: \(usernameTextField.text!)"
            destinationVC.password = "Password: \(passwordTextField.text!)"
        }
    }

    func alertMessages(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }

    @IBAction func signUpButton(_ sender: Any) {

        if usernameTextField.text! == ""{
            alertMessages(title: "Username Error", message: "Username can't be empty!")
        }
        else if passwordTextField.text! == ""{
            alertMessages(title: "Password Error", message: "Password can't be empty!")
        }
        else if passwordAgainTextField.text! == ""{
            alertMessages(title: "Password Error", message: "Passwords do not match!")
        }
        else{
            if(rememberSwitch.isOn){
                UserDefaults.standard.set(usernameTextField.text!, forKey: "username")
                UserDefaults.standard.set(passwordTextField.text!, forKey: "password")
                UserDefaults.standard.set(passwordAgainTextField.text!, forKey: "passwordAgain")
            }
            performSegue(withIdentifier: "signInVC", sender: nil)
        }
    }
}

