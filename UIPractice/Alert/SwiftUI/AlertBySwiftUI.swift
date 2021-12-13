//
//  AlertBySwiftUI.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/14.
//

import SwiftUI

struct AlertBySwiftUI: View {
    @State var showingAlert = false
    @State var showingActionSheet = false
    var body: some View {
        VStack {
            Button(action: {
                self.showingAlert = true
            }, label: {
                Text("Alert")
            })
            Button(action: {
                self.showingActionSheet = true
            }, label: {
                Text("ActionSheet")
            })
            
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("警告"), message: Text("アラートを表示してみました"), primaryButton: .default(Text("OK")), secondaryButton: .cancel(Text("キャンセル")))
        }
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(title: Text("警告"), message: Text("アクションシートを表示してみました"), buttons: [
                .default(Text("OK")),
                .cancel(Text("キャンセル"))
            ])
        }
    }
}

struct AlertBySwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        AlertBySwiftUI()
    }
}
