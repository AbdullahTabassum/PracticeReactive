//
//  QuestionaireView.swift
//  PracticeIos
//
//  Created by Apple on 2018-11-04.
//  Copyright © 2018 Abdullah. All rights reserved.
//

import Foundation
import UIKit

class QuestionaireView: UIView {
    
    //a label is needed
    var question: UILabel?
    
    //a component that will house the buttons
    let choices: StackChoiceButtons?
    
    init(frame: CGRect, choicesView: StackChoiceButtons) {
        
        question = UILabel()
        
        choices = choicesView
            
        super.init(frame: frame)
        
        self.setupViews()
        
        self.styleView()
    }
    
    private func setupViews() {
        
        self.addSubview(question!)
        question?.text = "What is the correct answer to the question below"
        question?.textAlignment = .center
        
        //create the constraints for all of the views
        question?.translatesAutoresizingMaskIntoConstraints = false
        
        question?.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        question?.topAnchor.constraint(equalTo:self.topAnchor, constant: 40).isActive = true
        question?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        //stack of choices
        choices?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(choices!)
        
        choices?.topAnchor.constraint(equalTo: question!.bottomAnchor, constant: 10).isActive = true
        choices?.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        choices?.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 0).isActive = true
        //choices?.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -200).isActive = true
        
    }
    
    private func styleView() {
        self.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
