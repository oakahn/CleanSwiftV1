import UIKit

class BNKTableViewCell: UITableViewCell {
  
  let headerCellUIView: UIView = {
    let uiView = UIView()
    uiView.translatesAutoresizingMaskIntoConstraints = false
    return uiView
  }()
  
  let headerImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "cherprang")
    imageView.layer.masksToBounds = true
    imageView.clipsToBounds = true
    return imageView
  }()
  
  let bnkNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.boldSystemFont(ofSize: 14)
    return label
  }()
  
  let moreIcon: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "more")
    return imageView
  }()
  
  let bnkImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  
  let bottomUIView: UIView = {
    let uiView = UIView()
    uiView.translatesAutoresizingMaskIntoConstraints = false
    return uiView
  }()
  
  let likeImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "heart")
    return imageView
  }()
  
  let commentImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "comment")
    return imageView
  }()
  
  let directImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "direct")
    return imageView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    setupAddSubView()
    setupConstraint()
  }
  
  private func setupAddSubView() {
    addSubview(headerCellUIView)
    addSubview(headerImage)
    addSubview(bnkNameLabel)
    addSubview(moreIcon)
    addSubview(bnkImage)
    addSubview(bottomUIView)
    addSubview(likeImage)
    addSubview(commentImage)
    addSubview(directImage)
  }
  
  private func setupConstraint() {
    setupHeaderUIView()
    setupHeaderImage()
    setupBNKImage()
    setupMoreIcon()
    setupBNKName()
    setupBottonUIView()
    setupLikeImage()
    setupCommmentImage()
    setupDirectImage()
  }
  
  private func setupHeaderUIView() {
    headerCellUIView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    headerCellUIView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    headerCellUIView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    headerCellUIView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
  }
  
  private func setupHeaderImage() {
    headerImage.layer.cornerRadius = 15
    headerImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
    headerImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
    headerImage.centerYAnchor.constraint(equalTo: headerCellUIView.centerYAnchor).isActive = true
    headerImage.leadingAnchor.constraint(equalTo: headerCellUIView.leadingAnchor, constant: 2).isActive = true
  }
  
  private func setupBNKName() {
    bnkNameLabel.centerYAnchor.constraint(equalTo: headerCellUIView.centerYAnchor).isActive = true
    bnkNameLabel.leftAnchor.constraint(equalTo: headerImage.rightAnchor, constant: 16).isActive = true
  }
  
  private func setupMoreIcon() {
    moreIcon.heightAnchor.constraint(equalToConstant: 15).isActive = true
    moreIcon.widthAnchor.constraint(equalToConstant: 15).isActive = true
    moreIcon.trailingAnchor.constraint(equalTo: headerCellUIView.trailingAnchor, constant: -4).isActive = true
    moreIcon.centerYAnchor.constraint(equalTo: headerCellUIView.centerYAnchor).isActive = true
  }
  
  private func setupBNKImage() {
    bnkImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
    bnkImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
    bnkImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    bnkImage.topAnchor.constraint(equalTo: headerCellUIView.bottomAnchor, constant: 8).isActive = true
  }
  
  private func setupBottonUIView() {
    bottomUIView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    bottomUIView.topAnchor.constraint(equalTo: bnkImage.bottomAnchor, constant: 8).isActive = true
    bottomUIView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    bottomUIView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    bottomUIView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
  }
  
  private func setupLikeImage() {
    likeImage.centerYAnchor.constraint(equalTo: bottomUIView.centerYAnchor).isActive = true
    likeImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
    likeImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
    likeImage.leftAnchor.constraint(equalTo: bottomUIView.leftAnchor, constant: 2).isActive = true
  }
  
  private func setupCommmentImage() {
    commentImage.centerYAnchor.constraint(equalTo: bottomUIView.centerYAnchor).isActive = true
    commentImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
    commentImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
    commentImage.leftAnchor.constraint(equalTo: likeImage.rightAnchor, constant: 16).isActive = true
  }
  
  private func setupDirectImage() {
    directImage.centerYAnchor.constraint(equalTo: bottomUIView.centerYAnchor).isActive = true
    directImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
    directImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
    directImage.leftAnchor.constraint(equalTo: commentImage.rightAnchor, constant: 16).isActive = true
  }
}
