//
//  JoinedSingleViewController.swift
//  SwiftyUtils_Example
//
//  Created by Josue Meza Peña on 25-02-18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class JoinedSingleViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Attributes
    
    private var defaultSingleTableView: UITableView!
    
    // MARK: - Keyboard events
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.bottomConstraint.constant = -keyboardHeight
            self.view.layoutIfNeeded()
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 1), at: .bottom, animated: true)
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        self.bottomConstraint.constant = 0
        self.view.layoutIfNeeded()
    }
    
    // MARK: - View controller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let defaultSingleTableViewController = storyboard.instantiateViewController(withIdentifier: "default_single_table_view_controller") as! DefaultSingleTableViewController
        self.defaultSingleTableView = defaultSingleTableViewController.tableView
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }

}

extension JoinedSingleViewController: UITableViewDataSource {
    
    // MARK: - Table View Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 3
        case 1: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let identifier = DefaultSingleTableViewCellIdentifier.title.rawValue
                let cell = self.defaultSingleTableView.dequeueReusableCell(withIdentifier: identifier) as! SingleTitleTableViewCell
                cell.titleLabel.text = "Joined"
                return cell
            case 1:
                let identifier = DefaultSingleTableViewCellIdentifier.paragrapth.rawValue
                let cell = self.defaultSingleTableView.dequeueReusableCell(withIdentifier: identifier) as! SingleParagraphTableViewCell
                cell.paragraphLabel.text = """
                Returns a new NSAttributedString by concatenating the elements of the sequence, adding the given separator between each element.
                - Parameter separator: A string to insert between each of the elements in this sequence. The default separator is an empty string.
                - Returns: A single, concatenated NSAttributedString.
                """
                return cell
            case 2:
                let identifier = DefaultSingleTableViewCellIdentifier.code.rawValue
                let cell = self.defaultSingleTableView.dequeueReusableCell(withIdentifier: identifier) as! SingleCodeTableViewCell
                cell.codeLabel.text = "func joined(separator: NSAttributedString) -> NSAttributedString"
                return cell
            default: return UITableViewCell()
            }
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "example_cell") as! JoinedSingleExampleTableViewCell
            return cell
        default: return UITableViewCell()
        }
    }
    
}
