//
//  CharacterDisplayViewControllerExtension.swift
//  CharacterTraitsViewer
//
//  Created by MacOS on 25.12.2021.
//

import Foundation
import UIKit
extension CharacterDisplayViewController: CharacterSelectionDelegate {
    func didTapChoice(image: UIImage) {
        characterImageView.image = image
    }
}
