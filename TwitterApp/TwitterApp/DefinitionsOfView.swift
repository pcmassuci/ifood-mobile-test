//
//  DefinitionsOfView.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 26/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

/// Commom items to be implemented in views
protocol DefinitionsOfView {
    
    /// To define color of elements
    func defineColors()
    
    /// To define fonts
    func defineFonts()
    
    /// To define accessibility
    func defineAccessibility()
    
    /// To define texts of labels and others
    func defineStaticTexts()
    
    /// To define identifier
    func defineIdentifier()
    
    /// To define layout
    func defineLayout()
    
    /// To define propertied
    func defineProperties()
}

extension DefinitionsOfView {
    
    func defineStaticTexts() {
        //define os textos estáticos
    }
    
    func defineFonts() {
        //define as fontes a serem usados
    }
    
    func defineAccessibility() {
        //define as configurações de acessibilidade
    }
    
    func defineColors() {
        //define as cores a serem utilizadas
    }
    
    func defineIdentifier() {
        //define os indenticadores de view
    }
    
    func defineLayout() {
        //define os layouts.
    }
    
    func defineProperties() {
        //define os properties.
    }
    
    /// To be called to define common items in views
    func setupDefinitions() {
        defineColors()
        defineFonts()
        defineStaticTexts()
        defineAccessibility()
        defineIdentifier()
        defineLayout()
        defineProperties()
    }
}
