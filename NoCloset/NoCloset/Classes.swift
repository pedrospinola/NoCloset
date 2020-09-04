//
//  Peca.swift
//  NoCloset
//
//  Created by Hélio Silva on 31/08/20.
//  Copyright © 2020 Pedro Spínola. All rights reserved.
//

import UIKit

class Peca{
    
    var foto: UIImage
    var nome: String
    var pertence: Bool = false
    
    init(foto: UIImage, nome:String) {
        self.foto = foto
        self.nome = nome
    }
    
}

class Look{
    
    var nome: String
    var pecas: [Peca]
    
    init(pecas: [Peca], nome:String) {
        self.pecas = pecas
        self.nome = nome
    }
}

class TipoLook{
    
    var nome: String
    var looks: [Look]
    
    init(looks: [Look], nome:String) {
        self.looks = looks
        self.nome = nome
    }
    
}



extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
