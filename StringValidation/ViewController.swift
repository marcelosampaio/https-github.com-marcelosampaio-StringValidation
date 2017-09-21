//
//  ViewController.swift
//  StringValidation
//
//  Created by Marcelo on 9/20/17.
//  Copyright © 2017 MAS. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    // MARK: - Outlets
    @IBOutlet weak var email: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    
    // MARK: - UI Actions
    @IBAction func proceed(_ sender: Any) {
        
        if String().isValidCpf(email.text!) {
            //
            print("👍")
        }else{
            print("👎")
        }


        
        /*
        if isValidEmail(email.text!) {
            // result OK
            print("👍")
        }else{
            print("👎")
        }
        */
        
        
        /*
        if isValidCpf(email.text!) {
            // result OK
            print("👍 for CPF")
        }else{
            print("👎 for CPF")
        }
        */
        
        
    }
    
    
    
    

}

