//
//  CharacterListViewViewModel.swift
//  AoifeAndBob
//
//  Created by Stephen O'Brien on 23/02/2023.
//

import UIKit

final class ABCharacterListViewViewModel: NSObject {
    
    private var cellViewModels: [ABCharacterCollectionViewCellViewModel] = []
    
    private var characters: [ABCharacter] = [] {
        didSet {
            for character in characters {
                let viewModel = ABCharacterCollectionViewCellViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image)
                )
                cellViewModels.append(viewModel)
            }
        }
    }
    
    public func fetchCharacters() {
        ABService.shared.execute(.listCharacterRequest,
                                 expecting: ABGetAllCharchartersResponse.self) {[weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                //let info = responseModel.Info
                self?.characters = results
                print(String("Count fetchCharacters:")+String(results.count))
            case .failure(let error):
                print(String(String(describing: error)))
            }
        }
    }
}

extension ABCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Count:"+String(cellViewModels.count))
    
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ABCharacterCollectionViewCell.cellIdentifer,
                for: indexPath
        )as? ABCharacterCollectionViewCell else {
            fatalError("Unsupported Cell")
        }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(
            width: width,
            height: width*1.5
        )
    }
    
}
