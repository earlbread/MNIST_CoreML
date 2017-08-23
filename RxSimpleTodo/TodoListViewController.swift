//
//  TodoListViewController.swift
//  RxSimpleTodo
//
//  Created by Seunghun Lee on 2017-07-17.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class TodoCell: UITableViewCell {
  @IBOutlet weak var contentLabel: UILabel!
}

class TodoListViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  var items = Variable([Todo]())
  let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()

    items.value.append(Todo(content: "HI"))

    items.asObservable()
      .bind(to: tableView.rx.items(cellIdentifier: "TodoCell",
                                   cellType: TodoCell.self)) { (_, element, cell) in
        cell.contentLabel?.text = element.content
      }
      .disposed(by: disposeBag)
  }
}
