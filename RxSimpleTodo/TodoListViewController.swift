//
//  TodoListViewController.swift
//  RxSimpleTodo
//
//  Created by Seunghun Lee on 2017-07-17.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {
  @IBOutlet weak var contentLabel: UILabel!
}

class TodoListViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

}
