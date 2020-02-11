//
//  ProspectsView.swift
//  Animations
//
//  Created by Jinchao Hou on 2/10/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI
import CodeScanner

struct ProspectsView: View {
    @EnvironmentObject var prospects: Prospects
    
    @State private var isShowingScanner = false
    
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    let filter: FilterType
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted proplr"
        }
    }
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none: return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted }
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted }
        }
    }
    
    var body: some View {
        NavigationView {
            ForEach(filteredProspects) {prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundColor(.secondary)
                }
                .contextMenu {
                    Button(prospect.isContacted ? "Mark Uncontackted" : "Mark Contacted") {
//                        prospect.isContacted.toggle()
                        self.prospects.toggle(prospect)
                    }
                }
            }
                
                
                .navigationBarTitle(title)
                .navigationBarItems(trailing: Button(action: {
                    self.isShowingScanner = true
                }) {
                    Image(systemName: "qrcode.viewfinder")
                    Text("Scan")
                })
                .sheet(isPresented: $isShowingScanner) {
                    CodeScannerView(codeTypes: [.qr], simulatedData: "linlin \nwindmor51@gmail.com", completion: self.handleScan)
            }
        }
    }
    
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        self.isShowingScanner = false
        switch result{
        case .success(let code):
            let details = code.components(separatedBy: "\n")
            guard details.count == 2 else {return}
            
            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]
            
            self.prospects.people.append(person)
        case .failure( _):
            print("Scanning failed")
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .contacted)
    }
}
