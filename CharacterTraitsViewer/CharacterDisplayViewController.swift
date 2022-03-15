//
//  ViewController.swift
//  CharacterTraitsViewer
//
//  Created by MacOS on 22.12.2021.
//

import UIKit


class CharacterDisplayViewController: UIViewController {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterGenderLabel: UILabel!
    @IBOutlet weak var characterChoiceButton: UIButton!
    
    let rick = Notification.Name(rawValue: NameKeys.Rick.rawValue)
    let morty = Notification.Name(rawValue: NameKeys.Morty.rawValue)
    let beth = Notification.Name(rawValue: NameKeys.Beth.rawValue)
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
    }
    
    func createObservers(){
        //Rick Observer
        NotificationCenter.default.addObserver(self, selector: #selector(CharacterDisplayViewController.updateNameLabel(notification:)), name: rick, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CharacterDisplayViewController.updateBackGround(notification:)), name: rick, object: nil)
        //Morty Observer
        NotificationCenter.default.addObserver(self, selector: #selector(CharacterDisplayViewController.updateNameLabel(notification:)), name: morty, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CharacterDisplayViewController.updateBackGround(notification:)), name: morty, object: nil)
        //Beth Observer
        NotificationCenter.default.addObserver(self, selector: #selector(CharacterDisplayViewController.updateNameLabel(notification:)), name: beth, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CharacterDisplayViewController.updateBackGround(notification:)), name: beth, object: nil)
    }
    
    @objc func updateNameLabel(notification: NSNotification){
        if notification.name == rick {
            let name =  NameKeys.Rick.rawValue
            characterNameLabel.text = name
        }else if notification.name == morty {
            let name = NameKeys.Morty.rawValue
            characterNameLabel.text = name
        }else if notification.name == beth {
            let name = NameKeys.Beth.rawValue
            characterNameLabel.text = name
        } else{
        }
    }
    
    @objc func updateBackGround(notification: NSNotification){
        if notification.name == rick {
            view.backgroundColor = .systemBlue
        }else if notification.name == morty {
            view.backgroundColor = .systemGreen
        }else if notification.name == beth {
            view.backgroundColor = .systemRed
        }
    }
    
    @IBAction func characterChoiceButtonTapped(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: ViewControllerKey.CharacterSelectionViewController.rawValue) as! CharacterSelectionViewController
        selectionVC.selectionDelegate = self
        selectionVC.completionHandler = { gender in
            self.characterGenderLabel.text = gender
        }
        selectionVC.modalPresentationStyle = .fullScreen
        
        present(selectionVC, animated: true, completion: nil)
    }
}
