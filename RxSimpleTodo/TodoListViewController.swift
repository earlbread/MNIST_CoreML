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

    tableView.dataSource = self
    tableView.delegate = self
  }

}

extension TodoListViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)

    cell.textLabel?.text = "HI"

    return cell
  }
}
