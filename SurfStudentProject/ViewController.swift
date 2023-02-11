import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    // MARK: - Layout Elements
    /// Root elements
    var scrollView = UIScrollView()
    var label = UILabel()
    var headerContainerView = UIView()
    var imageView = UIImageView()
    
    /// Content view that contains contentElements
    let contentView = UIView()
    
    /// View that contains two bottom buttons
    let twoButtonsView = UIView()
    
    /// ContentElements
    let elem1 = UIView()
    let elem2 = UIView()
    
    ///Buttons
    var titleForButton = ["IOS", "Android", "Design", "Flutter", "QA", "PM"]

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setViewConstraints()
    }

    private func configureUI() {
        scrollView.delegate = self
        scrollView.backgroundColor = .systemBackground
//        scrollView.layer.cornerRadius = 25
        scrollView.layer.masksToBounds = true
//        scrollView.layer.cornerCurve = .continuous
    
        
        headerContainerView.backgroundColor = .gray
        
        imageView.clipsToBounds = true
        imageView.backgroundColor = .green
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "background")
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 32

        
//        elem1.backgroundColor = .systemMint
        
        
        
        let mainTitleText = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        mainTitleText.font = UIFont.boldSystemFont(ofSize: 24)
        mainTitleText.text = "Стажировка в Surf"
        mainTitleText.sizeToFit()

        
        let subTitleText = UILabel(frame: CGRect(x: 0, y: mainTitleText.frame.maxY+12, width: 300, height: 300))
        subTitleText.font = UIFont.systemFont(ofSize: 14)
        subTitleText.numberOfLines = 0
        subTitleText.text = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты. "
        subTitleText.textColor = UIColor(red: 0.59, green: 0.58, blue: 0.61, alpha: 1.00)
        subTitleText.sizeToFit()
        
        
        let scrollViewWithButtons = UIScrollView(frame: CGRect(x: 0, y: subTitleText.frame.maxY+12, width: self.view.frame.width, height: 60))
        var frame : CGRect?

        for i in 0..<titleForButton.count {
            let button = UIButton(type: .custom)
            
            if i == 0 {
                frame = CGRect(x: 0, y: 0, width: 80, height: 44)
            } else {
                frame = CGRect(x: CGFloat(i * 92), y: 0, width: 80, height: 44)
            }

            button.frame = frame ?? CGRect(x: 10, y: 10, width: 130, height: 44)
            button.tag = i
            button.layer.cornerRadius = 12
            button.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.00)
            button.setTitleColor(.black, for: .normal)
//            button.rounded(border: 0, radius: button.frame.height/2)
            button.setTitle(titleForButton[i], for: .normal)
            button.setContentCompressionResistancePriority(.required, for: .horizontal)
            button.addTarget(self, action: #selector(selectTeam), for: .touchUpInside)
//            button.sizeToFit()
            scrollViewWithButtons.addSubview(button)
        }

        scrollViewWithButtons.contentSize = CGSize(width: 600, height: scrollViewWithButtons.frame.size.height)
        scrollViewWithButtons.sizeToFit()
        scrollViewWithButtons.showsHorizontalScrollIndicator = false
        scrollViewWithButtons.backgroundColor = .white
        
        elem1.addSubview(scrollViewWithButtons)
        elem1.addSubview(mainTitleText)
        elem1.addSubview(subTitleText)
        
        
        
        
        elem2.backgroundColor = .red
        
    
    
    }
    
    

       


    @objc func selectTeam() {

    }
    
    private func setContentViewConstraints() {
        contentView.addSubview(elem1)
        contentView.addSubview(elem2)
        
        elem1.translatesAutoresizingMaskIntoConstraints = false
        elem2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            elem1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            elem1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            elem1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            elem1.heightAnchor.constraint(equalToConstant: 300),
            elem1.bottomAnchor.constraint(equalTo: elem2.topAnchor, constant: -35),
            
            elem2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            elem2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            elem2.heightAnchor.constraint(equalToConstant: 300),
            elem2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    
    private func setViewConstraints() {
        view.addSubview(scrollView)
        scrollView.addSubview(headerContainerView)
        headerContainerView.addSubview(imageView)
        
        // ScrollView Constraints
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Content View Constraint
        // leading, trailing: view | bottom: scrollView.bottom = -10 | scrollView.top = 280
        // Height of ContentView calculates based on inside elements
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 450)
        ])
        
        // Subviews in ContentView. Configure all constraints here.
        setContentViewConstraints()
        
        // Header Container Constraints
        let headerContainerViewBottom : NSLayoutConstraint!
        headerContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        headerContainerViewBottom = headerContainerView.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 50)
        headerContainerViewBottom.priority = UILayoutPriority(rawValue: 900)
        headerContainerViewBottom.isActive = true
        
        // ImageView Constraints
        let imageViewTopConstraint: NSLayoutConstraint!
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor)
        ])
        
        imageViewTopConstraint = imageView.topAnchor.constraint(equalTo: view.topAnchor)
        imageViewTopConstraint.priority = UILayoutPriority(rawValue: 900)
        imageViewTopConstraint.isActive = true
        
        
        // Two buttons Constraints
        let twoButtonsViewTopConstraint: NSLayoutConstraint!
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            twoButtonsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            twoButtonsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            twoButtonsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

}

