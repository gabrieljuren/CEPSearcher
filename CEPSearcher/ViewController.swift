//
//  ViewController.swift
//  CEPSearcher
//
//  Created by Gabriel Juren on 27/11/21.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    struct Model: Codable {
        let cep: String
        let logradouro: String
        let complemento: String
        let bairro: String
        let localidade: String
        let uf: String
        let ibge: String
        let gia: String
        let ddd: String
        let siafi: String
    }
    
    private lazy var searchController: UISearchBar = {
        let searchController = UISearchBar()
        searchController.placeholder = "Pesquisar"
        searchController.delegate = self
        searchController.translatesAutoresizingMaskIntoConstraints = false
        searchController.widthAnchor.constraint(equalToConstant: 45).isActive = true
        searchController.heightAnchor.constraint(equalToConstant: 45).isActive = true
        return searchController
    }()
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Informações do endereço"
        label.textAlignment = .center
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelLogradouro: UILabel = {
        let label = UILabel()
        label.text = "Logradouro: "
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        return label
    }()
    
    private lazy var labelLogradouroValue: UILabel = {
        let label = UILabel()
        //label.text = "Rua Doutor Edmundo Bitencourt"
        label.font = UIFont(name: "Avenir", size: 15.5)
        return label
    }()
    
    private lazy var labelCep: UILabel = {
        let labelCep = UILabel()
        labelCep.text = "CEP:"
        labelCep.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        return labelCep
    }()
    
    private lazy var labelCepValue: UILabel = {
        let labelCep = UILabel()
        //labelCep.text = "02969-070"
        labelCep.font = UIFont(name: "Avenir", size: 15.5)
        return labelCep
    }()
    
    private lazy var labelLocalidade: UILabel = {
        let label = UILabel()
        label.text = "Estado:"
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        return label
    }()
    
    private lazy var labelLocalidadeValue: UILabel = {
        let label = UILabel()
        //label.text = "São Paulo - SP"
        label.font = UIFont(name: "Avenir", size: 15.5)
        return label
    }()
    
    private lazy var labelBairro: UILabel = {
        let label = UILabel()
        label.text = "Bairro:"
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        return label
    }()
    
    private lazy var labelBairroValue: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 15.5)
        return label
    }()
    
    private lazy var imageCorreio: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "correio")
        return imageView
    }()
    
    let centerStack = UIStackView()
    let stack = UIStackView()
    let stackCep = UIStackView()
    let stackLogradouro = UIStackView()
    let stackLocalidade = UIStackView()
    let stackBairro = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchController)
        view.addSubview(stack)
        
        stack.addSubview(labelTitle)
        stack.addSubview(centerStack)
        
        centerStack.addArrangedSubview(stackCep)
        centerStack.addArrangedSubview(stackLogradouro)
        centerStack.addArrangedSubview(stackLocalidade)
        centerStack.addArrangedSubview(stackBairro)
        
        stackCep.addArrangedSubview(labelCep)
        stackCep.addArrangedSubview(labelCepValue)
        
        stackLogradouro.addArrangedSubview(labelLogradouro)
        stackLogradouro.addArrangedSubview(labelLogradouroValue)
        
        stackLocalidade.addArrangedSubview(labelLocalidade)
        stackLocalidade.addArrangedSubview(labelLocalidadeValue)
        
        stackBairro.addArrangedSubview(labelBairro)
        stackBairro.addArrangedSubview(labelBairroValue)
        
        view.addSubview(imageCorreio)
        
        setLayout()
    }
    
    func setLayout() {
        searchController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        searchController.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        searchController.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        stack.axis = .vertical
        stack.backgroundColor = .systemGray6
        stack.heightAnchor.constraint(equalToConstant: 240).isActive = true
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        labelTitle.topAnchor.constraint(equalTo: stack.topAnchor, constant: 10).isActive = true
        labelTitle.centerXAnchor.constraint(equalTo: stack.centerXAnchor).isActive = true
        
        centerStack.axis = .vertical
        centerStack.spacing = 15
        centerStack.translatesAutoresizingMaskIntoConstraints = false
        centerStack.centerYAnchor.constraint(equalTo: stack.centerYAnchor).isActive = true
        centerStack.centerXAnchor.constraint(equalTo: stack.centerXAnchor).isActive = true
        centerStack.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -5).isActive = true
        
        stackCep.translatesAutoresizingMaskIntoConstraints = false
        stackCep.axis = .horizontal
        stackCep.spacing = 5
        
        stackLogradouro.axis = .horizontal
        stackLogradouro.spacing = 5
        
        stackLocalidade.axis = .horizontal
        stackLocalidade.spacing = 5
        
        labelCepValue.translatesAutoresizingMaskIntoConstraints = false
        labelCepValue.leadingAnchor.constraint(equalTo: stackCep.leadingAnchor, constant: 45).isActive = true
        
        labelLogradouroValue.translatesAutoresizingMaskIntoConstraints = false
        labelLogradouroValue.leadingAnchor.constraint(equalTo: stackCep.leadingAnchor, constant: 100).isActive = true
        
        labelLocalidadeValue.translatesAutoresizingMaskIntoConstraints = false
        labelLocalidadeValue.leadingAnchor.constraint(equalTo: stackCep.leadingAnchor, constant: 70).isActive = true
        
        labelBairroValue.translatesAutoresizingMaskIntoConstraints = false
        labelBairroValue.leadingAnchor.constraint(equalTo: stackCep.leadingAnchor, constant: 55).isActive = true
        
        imageCorreio.translatesAutoresizingMaskIntoConstraints = false
        imageCorreio.heightAnchor.constraint(equalToConstant: 500).isActive = true
        imageCorreio.widthAnchor.constraint(equalToConstant: 350).isActive = true
        imageCorreio.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageCorreio.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: -25).isActive = true
        
        imageCorreio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        imageCorreio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchController.resignFirstResponder()
        cleanLabelsValue()
        getCep()
    }
    
    func getCep() {
        guard let searchBarText = searchController.text else {
            return
        }
        
        let path = "https://viacep.com.br/ws/\(searchBarText.trimmingCharacters(in: .whitespacesAndNewlines))/json/"
        URLSession.shared.dataTask(with: URL(string: path)!, completionHandler: {data, response, error in
            guard let data = data else {
                return
            }
            
            var result: Model?
            do {
                result = try JSONDecoder().decode(Model.self, from: data)
            }
            catch {
                print(error)
            }
            
            guard let finalResult = result else {
                return
            }
            
            self.setModelValues(model: finalResult)
            
        }).resume()
    }
    
    func cleanLabelsValue() {
        labelCepValue.text = ""
        labelLogradouroValue.text = ""
        labelLocalidadeValue.text = ""
    }
    
    func setModelValues(model: Model) {
        DispatchQueue.main.async {
            self.labelCepValue.text = model.cep
            self.labelLogradouroValue.text = model.logradouro
            self.labelLocalidadeValue.text = "\(model.localidade) - \(model.uf)"
            self.labelBairroValue.text = model.bairro
        }
    }
}

