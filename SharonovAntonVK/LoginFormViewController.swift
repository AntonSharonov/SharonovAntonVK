//
//  LoginFormViewController.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 31/03/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

enum PanGestureDirection2 {
    case none
    case left
    case right
}

class LoginFormViewController: UIViewController {
    
    @IBOutlet weak var scrollBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginIcon: UIImageView!
    @IBOutlet weak var dot1: UISwitch!
    @IBOutlet weak var dot2: UISwitch!
    @IBOutlet weak var dot3: UISwitch!
    
    var currentPanGestureDirection: PanGestureDirection2 = .none
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 1, delay: 0, options: .repeat, animations: {
            self.dot1.alpha -= 1
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 0.25, options: .repeat, animations: {
            self.dot2.alpha -= 1
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 0.5, options: .repeat, animations: {
            self.dot3.alpha -= 1
        }, completion: nil)
        
        UIView.transition(
            with: loginIcon,
            duration: 1.4,
            options: [
                .transitionFlipFromRight,
                .repeat
            ],
            animations: {}
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGestureRec = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
               view.addGestureRecognizer(panGestureRec)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWasShown(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    @objc func panGesture(_ recognizer: UIPanGestureRecognizer){
        switch recognizer.state {
            
        case .began: break
          
            
        case .changed:
            let translationX = recognizer.translation(in: view).x
            currentPanGestureDirection = translationX > 0 ? .right : .left
            
            UIView.animate(
                withDuration: 0.3,
                animations: {
                    
                    
            })
            
        case .ended: break
//            if currentPanGestureDirection == .left {
//                currentPhotoIndex += 1
//                if currentPhotoIndex > photos.count - 1 { currentPhotoIndex = 0 }
//
//            } else {
//                currentPhotoIndex -= 1
//                if currentPhotoIndex < 0 { currentPhotoIndex = photos.count - 1 }
//            }
//
//            middleImageView.alpha = 1
//
//            middleImageView.transform = .identity
//            leftImageView.transform = .identity
//            rightImageView.transform = .identity
//
            
//            setImages()
            
        default:
            return
            
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "loginSegue" else { return true }
        let isAuth = auth()
        
        if !isAuth {
            showAuthError()
        }
        
        return isAuth
    }
    
    func auth() -> Bool {
        let login = loginTF.text!
        let password = passwordTF.text!
        
        return login == "admin" && password == "123456"
    }
    
    func showAuthError() {
        let alert = UIAlertController(title: "Error", message: "Incorrect login or password", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        print("Неверный логин или пароль")
    }
    
    
    @objc func keyboardWasShown(notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo as! [String: Any]
        let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        
        scrollBottomConstraint.constant = frame.height
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        scrollBottomConstraint.constant = 0
    }
    
    // 9.6 запихиваем делегат в тот контроллер, на который переходим (контроллер назначения)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = self
        // получаем destination (контроллер назначения)
        // у всех контроллеров есть свойство transitioningDelegate
        // записываем self в transitioningDelegate
    }
}


// 9.2 имплементируем контроллеру протокол UIViewControllerTransitioningDelegate
// вся суть этого делегата - вернуть анимацию и больше ничего
extension LoginFormViewController: UIViewControllerTransitioningDelegate {
    // 9.3 выбираем либо пару (презент - дисмисс) обычной анимации, либо пару интерактивной
    
    // 9.4 анимация презента вью контроллера
    func animationController(
        forPresented presented: UIViewController, // контроллер, который презентуется
        presenting: UIViewController, // контроллер, который создает анимацию
        source: UIViewController // контроллер, с которого все началось
    ) -> UIViewControllerAnimatedTransitioning? {
        Animator() // 9.9 возвращаем аниматор в качестве презента
    }
    
    // 9.5 анимация дисмисса вью контроллера
    func animationController(
        forDismissed dismissed: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        Animator() // 9.10 возвращаем аниматор в качестве дисмисса
    }
    
    // интерактивная анимация презента вью контроллера
    //    optional func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?
    
    // интерактивная анимация дисмисса вью контроллера
    //    optional func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?
    
    // отображение кастомных поп-апов
    // @available(iOS 8.0, *)
    // optional func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?
}

// 9.7 создаем класс аниматор и имплементируем ему протокол UIViewControllerAnimatedTransitioning, также наследуемся от класса NSObject (просто так надо обязательно делать при применении UIViewControllerAnimatedTransitioning)
final class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let duration = 3.0
    
    // возвращает продолжительность анимации
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        duration
    }
    
    // метод для анимации
    // 9.8 создаем анимацию
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // контроллер с которого переходим
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        
        // контроллер на который переходим
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        // фрейм подложки, на которой происходит анимация
        let containerViewFrame = transitionContext.containerView.frame
        
        // фрейм, который будет над экраном, тк y: -containerViewFrame.height
        // это то, куда мы будем двигаться, куда будем смещать
        let sourceViewTargetFrame = CGRect(
            x: 0,
            y: -containerViewFrame.height,
            width: source.view.frame.width, // размеры стандартные
            height: source.view.frame.height)
        
        // запомнили наш текущий размер (фрейм) экрана
        let destinationViewTargetFrame = source.view.frame
        
        // ручками кладем destination (то, куда мы переходим) в Subview контейнера
        // добавили дестинейшен на контейнер
        transitionContext.containerView.addSubview(destination.view)
        
        // установили ему фрейм (под экраном, тк y: containerViewFrame.height)
        // destination.view применяем и он уже находится под экраном
        destination.view.frame = CGRect(
            x: 0,
            y: containerViewFrame.height,
            width: source.view.frame.width,
            height: source.view.frame.height)
        
        
        UIView
            .animate(
                withDuration: duration,
                animations: {
                    // source.view.frame (текущий экран) = sourceViewTargetFrame (фрейм сверху)
                    // в результате текущий экран уходит наверх
                    source.view.frame = sourceViewTargetFrame
                    
                    // destination.view.frame (фрейм, который готов снизу) = destinationViewTargetFrame который = source.view.frame (текущий фрейм экрана)
                    // в результате нижний фрейм поднимается на место текущего экрана
                    destination.view.frame = destinationViewTargetFrame
            }) { finished in // по окончании анимации
                // когда текущий экран полностью доходит до верха мы его удаляем
                source.removeFromParent()
                
                // мы говорим контексту что завершили анимацию
                transitionContext.completeTransition(finished)
        }
    }
    
    // аниматор, который можно прервать в момент транзишена
    //    optional func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating
    
    
    // метод, который вызывается по окончании анимации (удобно, если нужно что-то удалить, например)
    // optional func animationEnded(_ transitionCompleted: Bool)
}
