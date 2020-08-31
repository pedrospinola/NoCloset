//
//  ViewController.swift
//  NoCloset
//
//  Created by Pedro Henrique Spínola de Assis on 31/08/20.
//  Copyright © 2020 Pedro Spínola. All rights reserved.
//

import UIKit

// GuardaRoupa
var acessorios:[Peca] = []
var parteCima:[Peca] = []
var parteBaixo:[Peca] = []
var calcado:[Peca] = []



//ViewController onde estarão agrupados os looks salvos
class TelaSeusLooks: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        encherAcessorios()
        encherCalcado()
        encherParteCima()
        encherParteBaixo()
        
        // Do any additional setup after loading the view.
    }


}

//ViewController onde o usuário vai poder salvar um look novo
class TelaNovoLook: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

//ViewController onde o usuário vai poder visualizar um look salvo
class TelaVerLook: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

// encher Guarda-Roupa

func encherAcessorios(){
    
    let nomes:[String] = ["Colar Flecha", "Oculos Quadrado", "Bucket Preto", "Chapéu de Palha", "Boné Azul", "Cordão de Prata", "Gorro Amarelo", "Óculos Redondo"]
    
    for n in 0..<8 {
        
        let novapeca: Peca = Peca(foto:UIImage(imageLiteralResourceName: "acessorio"+String(n+1)), nome: nomes[n])
        
        acessorios.append(novapeca)
        
    }
    
}

func encherParteCima(){
    
    let nomes:[String] = ["Camiseta Branca", "Camiseta Marrom", "Camiseta Cinza", "Camisa Listrada", "Camisa Espacial", "Casaco Azul", "Jaqueta Jeans"]
    
    for n in 0..<7 {
        
        let novapeca: Peca = Peca(foto:UIImage(imageLiteralResourceName: "pecaCima"+String(n+1)), nome: nomes[n])
        
        parteCima.append(novapeca)
        
    }
    
}

func encherParteBaixo(){
    
    let nomes:[String] = ["Short Pelicano", "Bermuda Jeans", "Short Bege", "Calça Adidas", "Jeans Preta", "Calça Alfaiataria", "Calça Cargo Verde", "Short Preto"]
    
    for n in 0..<8 {
        
        let novapeca: Peca = Peca(foto:UIImage(imageLiteralResourceName: "pecaBaixo"+String(n+1)), nome: nomes[n])
        
        parteBaixo.append(novapeca)
        
    }
    
}

func encherCalcado(){
    
    let nomes:[String] = ["Sapato Preto", "Havaiana", "Sapato Branco", "Papete Preta", "Chinelo Branco", "Meia Azul", "All Star Amarelo"]
    
    for n in 0..<7 {
        
        let novapeca: Peca = Peca(foto:UIImage(imageLiteralResourceName: "calcado"+String(n+1)), nome: nomes[n])
        
        calcado.append(novapeca)
        
    }
    
}
