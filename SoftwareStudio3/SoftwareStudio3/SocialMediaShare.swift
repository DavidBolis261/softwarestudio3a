//
//  SocialMediaShare.swift
//  SoftwareStudio3
//
//  Created by Amaan Ansari on 14/10/21.
//

import Foundation
import UIKit

class viewController: UIViewController {
    var body: some View {
    Button(action: actionSheet) {
    Image(systemName: "square.and.arrow.up")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 36, height: 36)
    }
        }
        
        func actionSheet() {
            guard let data = URL(string: "https://www.google.com") else { return }
            let av = UIActivityViewController(activityItems: [data], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
        }
    }


