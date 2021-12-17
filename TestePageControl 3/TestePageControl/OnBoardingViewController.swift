//
//  ViewController.swift
//  TestePageControl
//
//  Created by Lucas Oliveira on 18/03/21.
//

import UIKit

class OnBoardingViewController: UIViewController {
    lazy var pageControl = MyPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfDots = 6

        view.addSubview(pageControl)

        setupStackView()
    }


    func setupStackView() {
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
          pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
          pageControl.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }

}

