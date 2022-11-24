//
//  ContentView.swift
//  Reminders
//
//  Created by Elizaveta Petrovskaia on 20/11/22.
//

import SwiftUI
// static var voiceOver: AccessibilityTechnologies

struct CategoryCell: View {
    let iconName: String
    let iconColor: Color
    let title: String
    let count: String

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Image(systemName: iconName)
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundColor(iconColor)

                Text(title)
                    .font(.headline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Text(count).font(.title).fontWeight(.bold).foregroundColor(.black)
        }
        .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
        .background(Color(.systemBackground))
        .cornerRadius(12)
    }
}

struct ListCell: View {
    let iconName: String
    let iconColor: Color
    let title: String
    let count: String

    var body: some View {
        HStack{
            Image(systemName: iconName)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(iconColor)

            Text(title)
            Spacer()
            Text(count).foregroundColor(.gray)
        }
    }
}

struct ContentView: View {
    @State  private var search = " "

    var body: some View {
        NavigationStack {
            List {
                categoriesSection
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowBackground(Color.clear)
                listsSection
                    .listRowInsets(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 16))
            }
            .navigationBarItems(
                trailing:
                    Button(action: {
                        //
                    }, label: {
                        Image(systemName: "ellipsis.circle")
                    })
            )
            .searchable(
                text: $search,
                prompt: "Search"
            )
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                        Button {
                            //
                        } label: {
                            HStack{
                                Image(systemName: "plus.circle.fill").foregroundColor(.blue)
                                Text( "New Reminder") }
                        }
                        Spacer()
                        Button {
                            //
                        } label: {
                            Text( "Add List")
                        }

                    }
                }
            }
        }
    }

    private var categoriesSection: some View {
        LazyVGrid(columns: [.init(), .init()]) {
            CategoryCell(iconName: "d.circle.fill", iconColor: .blue,  title: "Today", count: "9")
               
            CategoryCell(iconName: "calendar.circle.fill", iconColor: Color.red, title: "Scheduled", count: "1")
            CategoryCell(iconName: "tray.circle.fill", iconColor: Color.black, title: "All", count: "4")
            CategoryCell(iconName: "flag.circle.fill", iconColor: Color.orange, title: "Flagged", count: "14")
            CategoryCell(iconName: "checkmark.circle.fill", iconColor: Color.gray, title: "Completed", count: "5")
        }
    }

    private var listsSection: some View {
        Section {
            NavigationLink(destination: EmptyView()) {
                ListCell(iconName: "doc.circle.fill", iconColor: .green, title: "Reminders", count: "17")
            }
            NavigationLink(destination: EmptyView()) {
                ListCell(iconName: "cart.circle.fill", iconColor: .yellow, title: "Groceries", count: "8")
            }
            NavigationLink(destination: EmptyView()) {
                ListCell(iconName: "book.circle.fill", iconColor: .purple, title: "Study", count: "3")
            }
        } header: {
            Text("My Lists")
                .textCase(nil)
                .font(.headline)
                .foregroundColor(.black)
                .bold()
        }
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

