//
//  SelectionViewController.swift
//  CharacterTraitsViewer
//
//  Created by MacOS on 22.12.2021.
//

import UIKit

class CharacterSelectionViewController: UIViewController {
    
    var selectionDelegate : CharacterSelectionDelegate!
    
    @IBOutlet weak var whichOneLabel: UILabel!
    @IBOutlet weak var rickSelectButton: UIButton!
    @IBOutlet weak var mortySelectButton: UIButton!
    @IBOutlet weak var bethSelectButton: UIButton!
    
    public var completionHandler : ((String?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func rickSelectButtonTapped(_ sender: Any) {
        let name = Notification.Name(rawValue: NameKeys.Rick.rawValue)
        NotificationCenter.default.post(name: name, object: nil)
        selectionDelegate.didTapChoice(image: UIImage(named: ImageKeys.rick.rawValue)!)
        completionHandler!(GenderKeys.male.rawValue)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func mortySelectButtonTapped(_ sender: Any) {
        let name = Notification.Name(rawValue: NameKeys.Morty.rawValue)
        NotificationCenter.default.post(name: name, object: nil)
        selectionDelegate.didTapChoice(image: UIImage(named: ImageKeys.morty.rawValue)!)
        completionHandler!(GenderKeys.male.rawValue)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func bethSelectButtonTapped(_ sender: Any) {
        let name = Notification.Name(rawValue:  NameKeys.Beth.rawValue)
        NotificationCenter.default.post(name: name, object: nil)
        selectionDelegate.didTapChoice(image: UIImage(named: ImageKeys.beth.rawValue)!)
        completionHandler!(GenderKeys.female.rawValue)
        dismiss(animated: true, completion: nil)
    }
}
