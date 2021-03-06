//
//  MealCell.swift
//  RecipeBuddy
//
//  Created by River McCaine on 10/18/21.
//

import UIKit

class MealCell: UITableViewCell {

    static let reuseID          = Cells.meal
    let mealImageView           = RBMealImageView(frame: .zero)
    let mealLabel               = RBTitleLabel(textAlignment: .left, fontSize: 22)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(meal: Meal) {
        let formattedMeal   = meal.name.replacingOccurrences(of: " and ", with: " & ").localizedCapitalized
        mealLabel.text      = formattedMeal
        mealImageView.downloadImage(fromURL: meal.thumbnail)
    }
    
    
    private func configure() {
        addSubviews(mealImageView, mealLabel)
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            mealImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            mealImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            mealImageView.heightAnchor.constraint(equalToConstant: 112),
            mealImageView.widthAnchor.constraint(equalToConstant: 112),
            
            mealLabel.centerYAnchor.constraint(equalTo: mealImageView.centerYAnchor),
            mealLabel.leadingAnchor.constraint(equalTo: mealImageView.trailingAnchor, constant: 14),
            mealLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            mealLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
} // END OF CLASS
