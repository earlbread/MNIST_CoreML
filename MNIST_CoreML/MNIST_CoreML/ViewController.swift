//
//  ViewController.swift
//  MNIST_CoreML
//
//  Created by Seunghun Lee on 2017-08-24.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import UIKit
import Vision
import CoreML

class ViewController: UIViewController {
  @IBOutlet weak var drawView: DrawView!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func resetCanvas(_ sender: UIButton) {
    drawView.lines = []
    drawView.setNeedsDisplay()
  }

  @IBAction func predictNumber(_ sender: UIButton) {
  }


}

