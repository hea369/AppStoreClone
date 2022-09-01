//
//  FeaturedCollectionViewCell.swift
//  AppStoreClone
//
//  Created by 박호현 on 2022/09/01.
//

import UIKit
import Kingfisher

struct FeaturedCollectionViewCellModel: Hashable {
    enum DownloadIcon {
        case get
        case open
        case cloud
    }
    
    let featureReason: String
    let title: String
    let subtitle: String
    let mainImage: String
    let iconImage: String
    let iconName: String
    let detail: String
    let downloadIcon: DownloadIcon
    let purchase: Bool
}
class FeaturedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var blueName: UILabel!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var subTitleName: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var appIconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var hasInAppPurchaseLabel: UILabel!
    
    func setModel(_ model: FeaturedCollectionViewCellModel) {
        blueName.text = model.featureReason
        titleName.text = model.title
        subTitleName.text = model.subtitle
        if let url = URL(string: model.mainImage) {
            mainImageView.kf.setImage(with: url)
            mainImageView.layer.cornerRadius = 10
        }
        nameLabel.text = model.iconName
        detailLabel.text = model.detail
        switch model.downloadIcon {
        case .get:
            downloadButton.setTitle("GET", for: .normal)
        case .open:
            downloadButton.setTitle("OPEN", for: .normal)
        case .cloud:
            break
        }
        hasInAppPurchaseLabel.isHidden = !model.purchase
    }
}

