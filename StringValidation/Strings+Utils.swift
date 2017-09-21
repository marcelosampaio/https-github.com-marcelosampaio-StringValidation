//
//  Strings+Utils.swift
//  StringValidation
//
//  Created by Marcelo on 9/20/17.
//  Copyright © 2017 MAS. All rights reserved.
//


import UIKit

extension String {
    
    // MARK: - Email Validation
    func isValidEmail(_ email: String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    
    // MARK: - CPF Validation
    func isValidCpf(_ input: String) -> Bool {
        if (input.isEmpty || isFakeCpf(input)) {
            return false
        }
        
        let cpf = input.characters.filter{"0123456789".characters.contains($0)}
        if cpf.count == 11 {
            let digitTen = (Int(String(cpf[9])) ?? 0)
            let digitEleven = (Int(String(cpf[10])) ?? 0)
            
            var resultModuleOne: Int = 0, resultModuleTwo: Int = 0, realValue: Int = 0
            var i: Int = 0, j: Int = 11
            for index in 0..<cpf.count-1 {
                realValue = (Int(String(cpf[index])) ?? 0)
                resultModuleTwo += (realValue * j)
                if (i > 0) {
                    realValue = (Int(String(cpf[index-1])) ?? 0)
                    resultModuleOne += (realValue * j)
                }
                i += 1;
                j -= 1;
            }
            resultModuleOne %= 11
            resultModuleOne = resultModuleOne < 2 ? 0 : resultModuleOne-11
            
            resultModuleTwo %= 11
            resultModuleTwo = resultModuleTwo < 2 ? 0 : resultModuleTwo-11
            
            if resultModuleOne < 0 {
                resultModuleOne *= -1
            }
            if resultModuleTwo < 0 {
                resultModuleTwo *= -1
            }
            if (resultModuleOne == digitTen && resultModuleTwo == digitEleven) {
                return true
            }
        }
        return false
    }

    private func isFakeCpf(_ cpf: String) -> Bool {
        if (cpf == "00000000000" || cpf == "11111111111" || cpf == "22222222222" || cpf == "33333333333" || cpf == "44444444444" || cpf == "55555555555" || cpf == "66666666666" || cpf == "77777777777" || cpf == "88888888888" || cpf == "99999999999" || cpf.characters.count == 0) {
            return true
        }
        return false
    }
    
    // MARK: - Password Validation
    func isValidPassword(_ password: String) -> Bool {
        
        if password.characters.count == 0 {
            return false
        }
        if password.range(of:" ") != nil {
            return false
        }
        return true
    }
    
    // MARK: - Name Validation
    func isValidName(_ name: String) -> Bool{
        if name.characters.count == 0 {
            return false
        }
        if name.range(of:" ") != nil {
            return false
        }
        return true
    }

    // MARK: - Helper
    private func getFirstDigit(str: String , index: Int) -> String {
        
        let start = str.index(str.startIndex, offsetBy: index)
        let end = str.index(str.endIndex, offsetBy: -1)
        let range = start..<end
        
        let result = str.substring(with: range)
        
        return result
    }
    
    private func getLastDigit(_ str: String) -> String {
        
        let start = str.index(str.endIndex, offsetBy: -1)
        let end = str.index(str.endIndex, offsetBy: 0)
        let range = start..<end
        
        let result = str.substring(with: range)
        
        return result
    }
    

    
    
    
}
