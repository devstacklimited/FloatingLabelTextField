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
    public var labelColor: Color
    @Binding public var text: String
    public var placeholder: String?
    public var isSecure: Bool
    public var keyboardType: UIKeyboardType
    public var autocapitalization: TextInputAutocapitalization?
    public var height: CGFloat
    public var cornerRadius: CGFloat
    public var borderColor: Color
    public var borderWidth: CGFloat
    public var labelFont: Font
    public var textFont: Font
    /// Local state for secure text visibility
    @State private var isPasswordVisible: Bool = false
    
    //MARK: - Init
    public init(
        label: String,
        text: Binding<String>,
        placeholder: String? = nil,
        isSecure: Bool = false,
        labelColor: Color = .black,
        keyboardType: UIKeyboardType = .default,
        autocapitalization: TextInputAutocapitalization? = .sentences,
        height: CGFloat = 48,
        cornerRadius: CGFloat = 8,
        borderColor: Color = .primary,
        borderWidth: CGFloat = 1,
        labelFont: Font = .system(size: 12),
        textFont: Font = .system(size: 16)
    ){
        self.label = label
        self._text = text
        self.placeholder = placeholder
        self.isSecure = isSecure
        self.labelColor = labelColor
        self.keyboardType = keyboardType
        self.autocapitalization = autocapitalization
        self.height = height
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.labelFont = labelFont
        self.textFont = textFont
    }
    
    //MARK: - Body
    public var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(borderColor.opacity(0.9), lineWidth: borderWidth)
                .background(
                    Color(UIColor.systemBackground)
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                )
            
            Text(label)
                .font(labelFont)
                .foregroundColor(labelColor)
                .padding(.horizontal, 6)
                .background(Color(UIColor.systemBackground))
                .offset(x: 12, y: -height / 2.1)
                .zIndex(1)
            
            /// Input field with optional eye icon
            HStack {
                Group {
                    if isSecure {
                        if isPasswordVisible {
                            TextField(placeholder ?? "", text: $text)
                                .font(textFont)
                                .textInputAutocapitalization(autocapitalization)
                                .keyboardType(keyboardType)
                        } else {
                            SecureField(placeholder ?? "", text: $text)
                                .font(textFont)
                                .textInputAutocapitalization(autocapitalization)
                                .keyboardType(keyboardType)
                        }
                    } else {
                        TextField(placeholder ?? "", text: $text)
                            .font(textFont)
                            .textInputAutocapitalization(autocapitalization)
                            .keyboardType(keyboardType)
                    }
                }
                
                /// Protection button
                if isSecure {
                    Button(action: {
                        isPasswordVisible.toggle()
                    }){
                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: height * 0.45, height: height * 0.45)
                            .foregroundColor(borderColor)
                    }
                }
            }
            .padding(.horizontal, 15)
            .frame(height: height - 16, alignment: .center)
        }
        .frame(height: height)
    }
}
