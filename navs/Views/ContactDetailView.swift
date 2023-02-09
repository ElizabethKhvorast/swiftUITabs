//
//  ContactDetailView.swift
//  navs
//
//  Created by Елизавета Хворост on 08.02.2023.
//

import SwiftUI

struct ContactDetailView: View
{
    let contact: Contact
    var body: some View {
        VStack {
            if let image = contact.image
            {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill() // add if you need
                    .frame(width: 44.0, height: 44.0) // as per your requirement
                    .clipped()
                    .padding()
            }
            Text(contact.name ?? "").padding()
            Text(contact.phone ?? "").padding()
        }
    }
}

struct ContactDetailView_Previews: PreviewProvider
{
    static var previews: some View {
        ContactDetailView(contact: Contact(name: "Name", phone: "123123", image: nil, id: 0))
    }
}
