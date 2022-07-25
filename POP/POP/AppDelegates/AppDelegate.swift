//
//  AppDelegate.swift
//  POP
//
//  Created by jc.kim on 7/25/22.
//

import Swinject
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let container = Container()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        container.register(Repository.self) { _ in UserDefaultRepository() }
        container.register(ToDoService.self) { c in
            let repository = c.resolve(Repository.self)!
            return ToDoServiceImpl.init(repository: repository)
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}


func Inject<Service>(_ serviceType: Service.Type) -> Service? {
    (UIApplication.shared.delegate as? AppDelegate)?.container.resolve(serviceType)
}
