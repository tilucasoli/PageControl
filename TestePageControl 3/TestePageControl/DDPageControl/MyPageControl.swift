//
//  MyPageControl.swift
//  TestePageControl
//
//  Created by Lucas Oliveira on 19/03/21.
//

import UIKit
class MyPageControl: UIView {

  var spacing = 8
  var numberOfDots: Int = 0 {
    didSet {
      ddDotsFactory(numberOfDots: numberOfDots, height: 20, width: 20)
    }
  }
  private let wrapperView: UIView = {
    let view = UIView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  var colorInative: UIColor = .gray
  let widthWhenSelected: CGFloat = 35

  private var dotsList: [MyDotsPageControl] = []

  override func draw(_ rect: CGRect) {
    super.draw(rect)

    for index in 0..<numberOfDots {

      let dot = dotsList[index]
      dot.backgroundColor = colorInative
      setupConstraintsDots(index: index, dot: dot)

    }
    dotsList.first?.isSelected = true

  }

  private func setupConstraintsDots(index: Int, dot: UIView) {
    dot.translatesAutoresizingMaskIntoConstraints = false
    if index == 0 {
      dot.leftAnchor.constraint(equalTo: wrapperView.leftAnchor).isActive = true

    } else if index == numberOfDots-1 {
      dot.rightAnchor.constraint(equalTo: wrapperView.rightAnchor).isActive = true
      dot.leftAnchor.constraint(equalTo: dotsList[index-1].rightAnchor, constant: 8).isActive = true

    } else {
      dot.leftAnchor.constraint(equalTo: dotsList[index-1].rightAnchor, constant: 8).isActive = true

    }
    dot.topAnchor.constraint(equalTo: wrapperView.topAnchor).isActive = true
    dot.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor).isActive = true
  }

  private func setupWrapperConstraints() {
    NSLayoutConstraint.activate([
      wrapperView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      wrapperView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      wrapperView.heightAnchor.constraint(equalTo: self.heightAnchor),
    ])
  }
}

//MARK: - Action
extension MyPageControl {
  @objc func isSelectedAction(sender: UIGestureRecognizer) {
    guard let selectedView = sender.view,
          let dotView = selectedView as? MyDotsPageControl else {
      return
    }

    UIView.animate(withDuration: 0.2, animations: { [weak self] in
      self?.desativeAllDots()
      dotView.isSelected.toggle()
      self?.layoutIfNeeded()
    })

  }

}

extension MyPageControl {
  private func ddDotsFactory(numberOfDots: Int, height: CGFloat, width: CGFloat) {
    self.addSubview(wrapperView)
    setupWrapperConstraints()
    for index in 0..<numberOfDots {
      let dot = MyDotsPageControl(width: width, widthWhenSelected: widthWhenSelected, height: height, colorInative: colorInative)
      let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(isSelectedAction(sender:)))
      dot.addGestureRecognizer(tapRecognizer)

      dotsList.append(dot)
      wrapperView.addSubview(dot)

      setupConstraintsDots(index: index, dot: dot)
    }
  }

  func desativeAllDots() {
    for dot in dotsList {
      dot.isSelected = false
    }
  }

}
