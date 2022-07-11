//
//  StinsenNavigationIssueExampleApp.swift
//  StinsenNavigationIssueExample
//
//  Created by Vadim Belyaev on 11.07.2022.
//

import Stinsen
import SwiftUI

@main
struct StinsenNavigationIssueExampleApp: App {
    var body: some Scene {
        WindowGroup {
            MainCoordinator().view()
        }
    }
}

final class MainCoordinator: NavigationCoordinatable {
    var stack = NavigationStack(initial: \MainCoordinator.start)

    @Root private var start = makeContentView
    @Route(.fullScreen) private var secondary = makeSecondaryCoordinator

    private func makeContentView() -> some View {
        ContentView(buttonAction: { [weak self] in
            self?.route(to: \.secondary)
        })
    }

    private func makeSecondaryCoordinator() -> SecondaryCoordinator {
        SecondaryCoordinator()
    }
}

final class SecondaryCoordinator: NavigationCoordinatable {
    var stack = NavigationStack(initial: \SecondaryCoordinator.start)

    @Root private var start = makeSecondaryView

    private func makeSecondaryView() -> some View {
        SecondaryView()
    }
}

struct ContentView: View {
    var buttonAction: (() -> Void)?
    var body: some View {
        Button {
            buttonAction?()
        } label: {
            Text("Open secondary view")
        }
    }
}

struct SecondaryView: View {
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            Text("Secondary")
        }
    }
}
