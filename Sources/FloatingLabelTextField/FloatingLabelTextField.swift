//
//  FloatingLabelTextField.swift
//  FloatingLabelTextField
//
//  Created by Usama Javed on 12/10/2025.
//
//  A customizable SwiftUI text field with an outlined border and floating label.
//  Supports secure input, keyboard customization, and flexible UI configuration.
//
//  License: MIT License
//  Copyright © 2025 Usama Javed. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
public struct FloatingLabelTextField: View {
    public let label: String
    @Binding public var text: String
    public var placeholder: String?
    public var isSecure: Bool
    public var keyboardType: UIKeyboardType
    public var autocapitalization: TextInputAutocapitalization?
    public var height: CGFloat
    public var cornerRadius: CGFloat
    public var borderColor: Color
    public var borderWidth: CGFloat
    
    public init(
        label: String,
        text: Binding<String>,
        placeholder: String? = nil,
        isSecure: Bool = false,
        keyboardType: UIKeyboardType = .default,
        autocapitalization: TextInputAutocapitalization? = .sentences,
        height: CGFloat = 40,
        cornerRadius: CGFloat = 6,
        borderColor: Color = .primary,
        borderWidth: CGFloat = 1
    ){
        self.label = label
        self._text = text
        self.placeholder = placeholder
        self.isSecure = isSecure
        self.keyboardType = keyboardType
        self.autocapitalization = autocapitalization
        self.height = height
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
    
    public var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(borderColor.opacity(0.9), lineWidth: borderWidth)
                .background(Color(UIColor.systemBackground))
            
            VStack(alignment: .leading, spacing: 0){
                Text(label)
                    .font(.system(size: 14))
                    .foregroundColor(Color.primary)
                    .padding(.horizontal, 6)
                    .background(Color(UIColor.systemBackground))
                    .offset(x: 12, y: -10)
                    .zIndex(1)
                
                Group {
                    if isSecure {
                        SecureField(placeholder ?? "", text: $text)
                            .textInputAutocapitalization(autocapitalization)
                            .keyboardType(keyboardType)
                    } else {
                        TextField(placeholder ?? "", text: $text)
                            .textInputAutocapitalization(autocapitalization)
                            .keyboardType(keyboardType)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
            }
            .padding(.top, 6)
        }
        .frame(minHeight: height, maxHeight: height)
    }
}
