//
//  ViewController.swift
//  NoCloset
//
//  Created by Pedro Henrique Spínola de Assis on 31/08/20.
//  Copyright © 2020 Pedro Spínola. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

// GuardaRoupa
var acessorios:[Peca] = []
var parteCima:[Peca] = []
var parteBaixo:[Peca] = []
var calcado:[Peca] = []

// LookMontado
var lookSelecionado:[Look] = []

// ContadorDeLooksMontados
var contador = 0


//ViewController onde estarão agrupados os looks salvos

 class TelaSeusLooks: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, CLLocationManagerDelegate{
   
// API do Tempo
    
    //Variaveis
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var imageTempo: UIImageView!
    @IBOutlet weak var labelTemp: UILabel!
    @IBOutlet weak var labelCidade: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var labelDicas: UILabel!
    
    var locationManager:CLLocationManager!
    
    // O resto está na extensão API
    
    //
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lookSelecionado.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewLooksCell", for: indexPath) as! CollectionViewLooksCell
        
        cell.looksImage.image = UIImage(imageLiteralResourceName: "Mask Group")
        cell.looksName.text = "Heterotop"
        
        return cell
    }
    
    
    @IBOutlet weak var TableViewLooks: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewLooksCell", for: indexPath) as! TableViewLooksCell
        
        cell.sessionOfLookTitle.text = "Looks de sair"
        cell.CollectionViewLook.delegate = self
        cell.CollectionViewLook.dataSource = self
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    
    //  sobreescrevendo a função touchesBegan para esconder o teclado quando o usuário tocar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var climaView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        encherAcessorios()
        encherCalcado()
        encherParteCima()
        encherParteBaixo()
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        climaView.layer.cornerRadius = 30
        
        TableViewLooks.delegate = self
        TableViewLooks.dataSource = self
        
        localizacao()
        
    }
    

    
    
}

//ViewController onde o usuário vai poder salvar um look novo

class TelaNovoLook: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return opcao[self.section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewNovoLookCell", for: indexPath) as! CollectionViewNovoLookCell
        
        cell.imagemPeçaDoLook.image = opcao[self.section][indexPath.row].foto
        
        cell.imagemPeçaDoLook.layer.cornerRadius = 30
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opcao.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewNovoLookCell", for: indexPath) as! TableViewNovoLookCell
        
        self.section = indexPath.row
        cell.sessionNewLook.text = "Acessório"
        cell.collectionViewNovoLook.delegate = self
        cell.collectionViewNovoLook.dataSource = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 330
    }
    
    
    //  sobreescrevendo a função touchesBegan para esconder o teclado quando o usuário tocar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var TableViewNovoLook: UITableView!
    
    var section = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        TableViewNovoLook.delegate = self
        TableViewNovoLook.dataSource = self
        
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

var opcao: [[Peca]] = [acessorios, parteCima, parteBaixo, calcado]


func encherAcessorios(){
    
    let nomes:[String] = ["Colar Flecha", "Oculos Quadrado", "Bucket Preto", "Chapéu de Palha", "Boné Azul", "Cordão de Prata", "Gorro Amarelo", "Óculos Redondo"]
    
    for n in 0..<7 {
        
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
    
    for n in 0..<7 {
        
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

class TelaNovoLook2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionViewNovoLook2: UICollectionView!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return opcao.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        for i in 0...opcao.count-2{
            if section == i {
                return opcao[i].count
            }
        } //rever esssa parte
        return opcao.last!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewNovoLook2Cell", for: indexPath) as! CollectionViewNovoLook2Cell
        
        cell.imagemNovoLook2.image = opcao[indexPath.section][indexPath.row].foto
        cell.linha = indexPath.section
        cell.coluna = indexPath.row
        
        
        return cell
        
    }
    
    //  sobreescrevendo a função touchesBegan para esconder o teclado quando o usuário tocar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        encherAcessorios()
//        encherCalcado()
//        encherParteCima()
//        encherParteBaixo()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionViewNovoLook2.delegate = self
        collectionViewNovoLook2.dataSource = self
        
    }
    
    // encher Guarda-Roupa
    
    
    var opcao: [[Peca]] = [acessorios, parteCima, parteBaixo, calcado]
    
//
//    func encherAcessorios(){
//
//        let nomes:[String] = ["Colar Flecha", "Oculos Quadrado", "Bucket Preto", "Chapéu de Palha", "Boné Azul", "Cordão de Prata", "Gorro Amarelo", "Óculos Redondo"]
//
//        for n in 0..<7 {
//
//            let novapeca: Peca = Peca(foto:UIImage(imageLiteralResourceName: "acessorio"+String(n+1)), nome: nomes[n])
//
//            acessorios.append(novapeca)
//
//        }
//
//    }
//
//    func encherParteCima(){
//
//        let nomes:[String] = ["Camiseta Branca", "Camiseta Marrom", "Camiseta Cinza", "Camisa Listrada", "Camisa Espacial", "Casaco Azul", "Jaqueta Jeans"]
//
//        for n in 0..<7 {
//
//            let novapeca: Peca = Peca(foto:UIImage(imageLiteralResourceName: "pecaCima"+String(n+1)), nome: nomes[n])
//
//            parteCima.append(novapeca)
//
//        }
//
//    }
//
//    func encherParteBaixo(){
//
//        let nomes:[String] = ["Short Pelicano", "Bermuda Jeans", "Short Bege", "Calça Adidas", "Jeans Preta", "Calça Alfaiataria", "Calça Cargo Verde", "Short Preto"]
//
//        for n in 0..<7 {
//
//            let novapeca: Peca = Peca(foto:UIImage(imageLiteralResourceName: "pecaBaixo"+String(n+1)), nome: nomes[n])
//
//            parteBaixo.append(novapeca)
//
//        }
//
//    }
//
//    func encherCalcado(){
//
//        let nomes:[String] = ["Sapato Preto", "Havaiana", "Sapato Branco", "Papete Preta", "Chinelo Branco", "Meia Azul", "All Star Amarelo"]
//
//        for n in 0..<7 {
//
//            let novapeca: Peca = Peca(foto:UIImage(imageLiteralResourceName: "calcado"+String(n+1)), nome: nomes[n])
//
//            calcado.append(novapeca)
//
//        }
//    }
    
    func adicionaLooks(){
        
        for i in 0...opcao.count{
            for j in 0...opcao[i].count{
                if opcao[i][j].pertence == true{
                    lookSelecionado[contador].pecas.append(opcao[i][j])
                    
                }
                
            }
        }
        
        // salvar o nome do look aqui nessa linha
        //lookSelecionado[contador].nome = aquiEntraAOutletdoTextField
        
        contador = contador + 1
    }
}

//Preciso do Storyboard p linkar o textfield para um outlet que vai pegar o nome do look
// Preciso de um botão para salvar e chamar a função adicionaLooks
