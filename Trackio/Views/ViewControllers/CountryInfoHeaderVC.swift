//
//  CountryInfoHeaderVC.swift
//  Trackio
//
//  Created by Harun Gunes on 22/01/2022.
//

import UIKit

class CountryInfoHeaderVC: UIViewController {
  
  let flagImageView = FlagImageView(frame: .zero)
  let countryNameLabel = TrTitleLabel(align: .left, fontSize: 25)
  let dateLabel = UILabel()
  
  var country: Country!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    configureUIElements()
  }
  
  init(country: Country) {
    super.init(nibName: nil, bundle: nil)
    self.country = country
    configureUI()
    configureUIElements()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureUI() {
    view.addSubview(flagImageView)
    view.addSubview(countryNameLabel)
    view.addSubview(dateLabel)
    
    flagImageView.translatesAutoresizingMaskIntoConstraints = false
    countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
    dateLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let padding: CGFloat = 20
    
    NSLayoutConstraint.activate([
      flagImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
      flagImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
      flagImageView.heightAnchor.constraint(equalToConstant: 95),
      flagImageView.widthAnchor.constraint(equalToConstant: 120),
      
      countryNameLabel.topAnchor.constraint(equalTo: flagImageView.topAnchor),
      countryNameLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: padding),
      countryNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
      countryNameLabel.heightAnchor.constraint(equalToConstant: 35),
      
      dateLabel.centerYAnchor.constraint(equalTo: flagImageView.centerYAnchor),
      dateLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: padding),
      dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
      dateLabel.heightAnchor.constraint(equalToConstant: 30)
    ])
  }
  
  func configureUIElements() {
    flagImageView.downloadImage(from: country.countryInfo.flag)
    countryNameLabel.text = country.country
    dateLabel.text = Date().monthDayYearString
    dateLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    dateLabel.textColor = .secondaryLabel
  }
}
