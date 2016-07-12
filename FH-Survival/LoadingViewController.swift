//
//  LoadingViewController.swift
//
//  Created by Benjamin Böcker on 22.05.2016.
//  Copyright © 2016 Benjamin Böcker. All rights reserved.


import UIKit


class LoadingViewController : UIViewController {

	/// Reference to the actual loading view, of type `LoadingView`
	var loadingView: LoadingView?

	/**
	Override loadView to construct the loading view programmatically.
	**/
	override func loadView() {
		super.loadView()

		let loadingViewFrame = CGRectMake(50, 50, 120, 120)
		self.loadingView = LoadingView(frame: loadingViewFrame)

		if let loadingView = self.loadingView {
			self.view.addSubview(loadingView)
			//loadingView.configureConstraints()
		}
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		guard let loadingView = self.loadingView where animated == false else { return }

		loadingView.transform = CGAffineTransformMakeScale(0.01, 0.01)

		UIView.animateWithDuration(0.2, animations: {
			loadingView.transform = CGAffineTransformMakeScale(1.1, 1.1)
		}) { (finished) in
			UIView.animateWithDuration(0.2, animations: {
				loadingView.transform = CGAffineTransformMakeScale(1, 1)
			})
		}
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)


	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()

		guard let loadingView = self.loadingView else { return }

		loadingView.center = self.view.center
	}

	override func willMoveToParentViewController(parent: UIViewController?) {
		if parent == nil {
			self.removeLoadingView()
		}

		super.willMoveToParentViewController(parent)
	}

	private func removeLoadingView() {
		guard let loadingView = self.loadingView else { return }

		UIView.animateWithDuration(0.2, animations: {
			loadingView.transform = CGAffineTransformMakeScale(1.1, 1.1)
		}) { (finished) in
			UIView.animateWithDuration(0.1, animations: {
				loadingView.transform = CGAffineTransformMakeScale(0.01, 0.01)
			})
		}
	}

	class LoadingView: UIView {
		private var activityIndicatorView: UIActivityIndicatorView?

		override init(frame: CGRect) {
			super.init(frame: frame)

			self.configureLoadingView()
		}

		required init?(coder aDecoder: NSCoder) {
			super.init(coder: aDecoder)

			self.configureLoadingView()
		}

		private func configureLoadingView() {
			self.backgroundColor = UIColor(white: 0.0, alpha: 0.6)
			self.layer.cornerRadius = 5.0

			self.activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
			self.activityIndicatorView?.startAnimating()

			if let activityIndicatorView = self.activityIndicatorView {
				self.addSubview(activityIndicatorView)
			}
		}

		override func layoutSubviews() {
			super.layoutSubviews()

			guard let activityIndicatorView = self.activityIndicatorView else { return }

			activityIndicatorView.bounds = self.bounds
			let x = CGRectGetWidth(self.bounds) / 2
			let y = CGRectGetHeight(self.bounds) / 2
			activityIndicatorView.center = CGPointMake(x, y)
		}
	}
}

protocol Loading {}

extension Loading where Self: UIViewController {
	var loader: LoadingViewController? {
		for viewController in self.childViewControllers where viewController is LoadingViewController {
			return viewController as? LoadingViewController
		}

		return nil
	}

	func showLoadingViewController() -> LoadingViewController {
		if let loader = self.loader {
			return loader
		}

		let loadingViewController = LoadingViewController()

		self.addChildViewController(loadingViewController)
		loadingViewController.didMoveToParentViewController(self)
		self.view.addSubview(loadingViewController.view)

		return loadingViewController
	}

	func hideLoadingViewController() {
		guard let loader = self.loader else { return }

		loader.willMoveToParentViewController(nil)
		loader.view.removeFromSuperview()
		loader.removeFromParentViewController()
	}
}







