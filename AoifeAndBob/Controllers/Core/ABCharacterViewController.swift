//
//  ABCharacterViewController.swift
//  AoifeAndBob
//
//  Created by Stephen O'Brien on 14/02/2023.
//

import UIKit

/// Controller to to show and search for charters
final class ABCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        title = "Characters"
        
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
                                 expecting: ABCharacter.self)
        {
                result in 
        }
    }
    

}
