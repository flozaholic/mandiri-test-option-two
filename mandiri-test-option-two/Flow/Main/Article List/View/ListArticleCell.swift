//
//  ListArticleCell.swift
//  mandiri-test-option-two
//
//  Created by Admin on 25/3/21.
//

import UIKit

class ListArticleCell: UITableViewCell {

    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var imageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelToImageConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setupUI() {
        self.title.textColor = .greenText
        self.title.numberOfLines = 0
        self.detail.numberOfLines = 0
    }
    
    func setupCell(title: String?, detail: String?) {
        self.title.text = title
        self.detail.text = detail
    }
    
}
