import SwiftUI


@main
struct MyApp: App {
    
    init() {
        NSSetUncaughtExceptionHandler { exception in
                    print("💥 Exception thrown: \(exception)")
                }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
