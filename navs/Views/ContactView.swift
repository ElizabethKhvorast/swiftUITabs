//
//  ContactView.swift
//  navs
//
//  Created by Елизавета Хворост on 08.02.2023.
//

import SwiftUI
import Contacts

struct ContactView: View
{
    let contact: Contact
    
    var body: some View {
        HStack {
            if let image = contact.image
            {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill() // add if you need
                    .frame(width: 44.0, height: 44.0) // as per your requirement
                    .clipped()
            }
            Text(contact.name ?? "")
        }
    }
}

struct ContactView_Previews: PreviewProvider
{
    static var previews: some View {
        ContactView(contact: Contact(name: "Name", phone: "+4523123", image: nil, id: 0))
    }
}
