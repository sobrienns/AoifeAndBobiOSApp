//
//  ABCharacterViewController.swift
//  AoifeAndBob
//
//  Created by Stephen O'Brien on 14/02/2023.
//

import UIKit

/// Controller to to show and search for charters
final class ABCharacterViewController: UIViewController {

    private let characterListView = ABCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        /*
        let request = ABRequest(
            endpoint: .character,
            //pathComponents: ["1"]
            queryParameters: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive")
            ]
        )
        print(request.url)
        
        ABService.shared.execute(request,
                                 expecting: ABCharacter.self){result in
            switch result {
            case .success:
                break
            case .failure(let error):
                print(String(describing: error))
            }
        }*/
    }
    

}
