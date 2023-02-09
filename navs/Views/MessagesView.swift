//
//  MessagesView.swift
//  navs
//
//  Created by Елизавета Хворост on 08.02.2023.
//

import SwiftUI
import Contacts

struct MessagesView: View
{
    @EnvironmentObject var rootViewModel: RootViewModel
    @State var showDetailView: Bool = false
    @State var selectedEntry: Contact? = nil
    
    var body: some View {
        NavigationView {
            let contacts = self.getContacts()
            List {
                   ForEach (contacts) { contact in
                       ContactView(contact: contact).onTapGesture {
                           self.selectedEntry = contact
                           self.showDetailView = true
                       }
                   }
            }.sheet(isPresented: self.$showDetailView, content: {
                if let entry = self.selectedEntry
                {
                    ContactDetailView(contact: entry).presentationDetents([.medium, .large])
                }
                else
                {
                    Text("Something went wrong")
                }
            })
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    func getContacts() -> [Contact]
    {
        let contactStore = CNContactStore()
        var contacts = [Contact]()
        let keys = [CNContactGivenNameKey, CNContactPhoneNumbersKey, CNContactImageDataKey]
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        do
        {
            try contactStore.enumerateContacts(with: request) { (contact, stop) in
                var image: UIImage?
                if let data = contact.imageData, let contactImage = UIImage(data: data)
                {
                    image = contactImage
                }
                let newContact = Contact(name: contact.givenName,
                                         phone: contact.phoneNumbers.first?.value.stringValue,
                                         image: image,
                                         id: contact.hash)
                contacts.append(newContact)
            }
        }
        catch
        {
            print(error.localizedDescription)
        }
        return contacts
    }
}

struct MessagesView_Previews: PreviewProvider
{
    static var previews: some View {
        MessagesView()
    }
}

struct Contact: Identifiable
{
    let name: String?
    let phone: String?
    let image: UIImage?
    let id: Int
}
