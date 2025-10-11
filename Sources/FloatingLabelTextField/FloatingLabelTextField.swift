// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI

@available(iOS 15.0, *)
public struct FloatingLabelTextField: View {
    public let label: String
    @Binding public var text: String
    public var placeholder: String?
    public var isSecure: Bool
    public var keyboardType: UIKeyboardType
    public var autocapitalization: TextInputAutocapitalization?
    
    public init(
        label: String,
        text: Binding<String>,
        placeholder: String? = nil,
        isSecure: Bool = false,
        keyboardType: UIKeyboardType = .default,
        autocapitalization: TextInputAutocapitalization? = .sentences
    ){
        self.label = label
        self._text = text
        self.placeholder = placeholder
        self.isSecure = isSecure
        self.keyboardType = keyboardType
        self.autocapitalization = autocapitalization
    }
    
    public var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(Color.primary.opacity(0.9), lineWidth: 1)
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
                .padding(.vertical, 10)
            }
            .padding(.top, 6)
        }
        .frame(minHeight: 48)
    }
}
