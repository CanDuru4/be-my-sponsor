//
//  SceneDelegate.swift
//  SponsorApp
//
//  Created by Can Duru on 18.09.2022.
//

import UIKit
import FirebaseCore

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard FirebaseApp.app() != nil else {
            guard let windowScene = scene as? UIWindowScene else { return }
            let setupWindow = UIWindow(windowScene: windowScene)
            let controller = UIViewController()
            controller.view.backgroundColor = .systemBackground
            let message = UILabel()
            message.text = "Firebase setup required. Add this app's GoogleService-Info.plist to the app target and rebuild."
            message.numberOfLines = 0
            message.textAlignment = .center
            message.translatesAutoresizingMaskIntoConstraints = false
            controller.view.addSubview(message)
            NSLayoutConstraint.activate([
                message.leadingAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
                message.trailingAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
                message.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor)
            ])
            setupWindow.rootViewController = controller
            window = setupWindow
            setupWindow.makeKeyAndVisible()
            return
        }

        guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)

        //MARK: Create Navigation Controller
        let nav = UINavigationController()
        nav.viewControllers = [TabBarViewController()]
        nav.setNavigationBarHidden(true, animated: true)
        
        //MARK: Set App Start
        self.window?.rootViewController = nav
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}

