//
//  MyDotsPageControl.swift
//  TestePageControl
//
//  Created by Lucas Oliveira on 03/04/21.
//

import UIKit

class MyDotsPageControl: UIView {

    private let widthWhenSelected: CGFloat

    private let width: CGFloat
    private let height: CGFloat

    private lazy var constraintWidthNonSelected = widthAnchor.constraint(equalToConstant: width)
    private lazy var constraintWidthSelected = widthAnchor.constraint(equalToConstant: widthWhenSelected)

    var colorInative: UIColor = .gray

    var isSelected: Bool = false {
        didSet {
            if isSelected {
                constraintWidthNonSelected.isActive = !isSelected
                constraintWidthSelected.isActive = isSelected
                backgroundColor = tintColor
            } else {
                constraintWidthSelected.isActive = isSelected
                constraintWidthNonSelected.isActive = !isSelected
                backgroundColor = colorInative
            }
        }
    }

    init(width: CGFloat, widthWhenSelected: CGFloat, height: CGFloat, colorInative: UIColor?) {
        self.width = width
        self.height = height
        self.widthWhenSelected = widthWhenSelected

        super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))

        self.layer.cornerRadius = height/2

        self.constraintWidthNonSelected.isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
