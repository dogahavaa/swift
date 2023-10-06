//
//  signInViewController.swift
//  SignUpProjectWithAlert
//
//  Created by Doğa on 5.10.2023.
//

import UIKit

class signInViewController: UIViewController {

    @IBOutlet weak var hosgeldinizLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!

    var username = ""
    var password = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        hosgeldinizLabel.text = username
        passwordLabel.text = password
    }
    



}
