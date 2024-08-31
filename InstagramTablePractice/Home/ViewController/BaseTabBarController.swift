import Foundation
import UIKit

class BaseTabBarController: UITabBarController {
    
    private let homeViewController: UIViewController = {
        let viewController = HomeViewController()
        viewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        viewController.navigationItem.title = "Instagram"
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
        
        
    }()
    
    private let searchViewController: UIViewController = {
        let viewController = SearchViewController()  // Replace with your actual view controller class
        viewController.view.backgroundColor = .white
        viewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        return viewController
    }()
    
    private let thirdViewController: UIViewController = {
        let viewController = UIViewController()  // Replace with your actual view controller class
        viewController.view.backgroundColor = .red
        viewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "plus.app"), tag: 2)
        return viewController
    }()
    
    private let fouthViewController: UIViewController = {
        let viewController = UIViewController()  // Replace with your actual view controller class
        viewController.view.backgroundColor = .blue
        viewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "play.square.stack"), tag: 4)
        return viewController
    }()
    
    private let fifthViewController: UIViewController = {
        let viewController = UIViewController()  // Replace with your actual view controller class
        viewController.view.backgroundColor = .yellow
        viewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person.crop.circle"), tag: 5)
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Customize the navigation bar appearance
        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithOpaqueBackground()
        navAppearance.backgroundColor = .black // Set the background color of the navigation bar
//        navAppearance.titleTextAttributes = [.foregroundColor: UIColor.white] // Set the title color to white
        navAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white] // Set large title color to white

        
        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
        
        let barAppearance = UITabBarAppearance()
                barAppearance.configureWithOpaqueBackground()
                barAppearance.backgroundColor = .black // Set tab bar background color to white
                barAppearance.stackedLayoutAppearance.selected.iconColor = .white // Set selected tab icon color to white
                barAppearance.stackedLayoutAppearance.normal.iconColor = .gray // Set normal (unselected) tab icon color to gray
                
                UITabBar.appearance().standardAppearance = barAppearance
                if #available(iOS 15.0, *) {
                    UITabBar.appearance().scrollEdgeAppearance = barAppearance
                }
        
        
        
        // Add the view controllers to the tab bar controller
        viewControllers = [
            homeViewController,
            searchViewController,
            thirdViewController,
            fouthViewController,
            fifthViewController,
        ]
    }
}
