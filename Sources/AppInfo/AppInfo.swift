// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

public enum App: Hashable {
    case lemon
    case moontake
    case coconut
    case festivals
    case pigeon
    case one
    case offDay
    case tagDay
    
    var image: UIImage? {
        switch self {
        case .lemon:
            return UIImage(named: "LemonIcon", in: .module, compatibleWith: nil)
        case .moontake:
            return UIImage(named: "MoontakeIcon", in: .module, compatibleWith: nil)
        case .coconut:
            return UIImage(named: "CoconutIcon", in: .module, compatibleWith: nil)
        case .festivals:
            return UIImage(named: "FestivalsIcon", in: .module, compatibleWith: nil)
        case .pigeon:
            return UIImage(named: "PigeonIcon", in: .module, compatibleWith: nil)
        case .one:
            return UIImage(named: "OneOneIcon", in: .module, compatibleWith: nil)
        case .offDay:
            return UIImage(named: "OffDayIcon", in: .module, compatibleWith: nil)
        case .tagDay:
            return UIImage(named: "TagDayIcon", in: .module, compatibleWith: nil)
        }
    }
    
    var name: String {
        switch self {
        case .lemon:
            return String(localized: "app.lemon.title", bundle: .module, comment: "A Lemon Diary")
        case .moontake:
            return "moontake"
        case .coconut:
            return String(localized: "app.coconut.title", bundle: .module, comment: "Calendar Island")
        case .festivals:
            return String(localized: "app.festivals.title", bundle: .module, comment: "China Festivals")
        case .pigeon:
            return String(localized: "app.pigeon.title", bundle: .module, comment: "Air Pigeon")
        case .one:
            return "1/1"
        case .offDay:
            return String(localized: "app.offDay.title", bundle: .module, comment: "Off Day")
        case .tagDay:
            return String(localized: "app.tagDay.title", bundle: .module)
        }
    }
    
    var subtitle: String {
        switch self {
        case .lemon:
            return String(localized: "app.lemon.subtitle", bundle: .module, comment: "A pure text diary")
        case .moontake:
            return String(localized: "app.moontake.subtitle", bundle: .module, comment: "A camera for moon")
        case .coconut:
            return String(localized: "app.coconut.subtitle", bundle: .module, comment: "Calendar + Dynamic Island")
        case .festivals:
            return String(localized: "app.festivals.subtitle", bundle: .module, comment: "What festival is it today?")
        case .pigeon:
            return String(localized: "app.pigeon.subtitle", bundle: .module, comment: "Focus Mode On")
        case .one:
            return String(localized: "app.one.subtitle", bundle: .module, comment: "1/1")
        case .offDay:
            return String(localized: "app.offDay.subtitle", bundle: .module)
        case .tagDay:
            return String(localized: "app.tagDay.subtitle", bundle: .module)
        }
    }
    
    public var storeId: String {
        switch self {
        case .lemon:
            return "6449700998"
        case .moontake:
            return "6451189717"
        case .coconut:
            return "6469671638"
        case .festivals:
            return "6460976841"
        case .pigeon:
            return "6473819512"
        case .one:
            return "6474681491"
        case .offDay:
            return "6501973975"
        case .tagDay:
            return "6745145597"
        }
    }
}

public class AppCell: UITableViewCell {
    private var icon: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private var firstLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .natural
        label.textColor = .label
        label.numberOfLines = 1
        
        return label
    }()
    
    private var secondLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.textAlignment = .natural
        label.textColor = .secondaryLabel
        label.numberOfLines = 1
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 添加 icon 到 contentView
        contentView.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            icon.widthAnchor.constraint(equalToConstant: 50),
            icon.heightAnchor.constraint(equalToConstant: 50),
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])

        // 添加 firstLabel 到 contentView
        contentView.addSubview(firstLabel)
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16),
            firstLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            firstLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12)
        ])

        // 添加 secondLabel 到 contentView
        contentView.addSubview(secondLabel)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16),
            secondLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 10),
            secondLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func update(_ app: App) {
        icon.image = app.image
        firstLabel.text = app.name
        secondLabel.text = app.subtitle
    }
}
