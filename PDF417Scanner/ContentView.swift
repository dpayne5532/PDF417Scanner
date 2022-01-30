//
//  ContentView.swift
//  PDF417Scanner
//
//  Created by Dan Payne on 1/29/22.
//
import CodeScanner
import SwiftUI

struct ContentView: View {
    @State private var isShowingScanner = false
    var body: some View {
        NavigationView {
            List {
                ForEach(1..<10) { prospect in
                    VStack(alignment: .leading) {
                        Text("Hi")
                            .font(.headline)
                        Text("dan")
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            
            
           
                .navigationTitle("Title")
                .toolbar {
                    Button {
                       isShowingScanner = true
                    } label: {
                        Label("Scan", systemImage: "qrcode.viewfinder")
                    }
                }
                .sheet(isPresented: $isShowingScanner) {
                    CodeScannerView(codeTypes: [.pdf417], simulatedData:  "Dan Payne\nDpayne5532@icloud.com", completion: handleScan)
                }
            
        }
    }

    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            print(details)
         
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        
        }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
