module ApplicationHelper
  def full_image_url(image_uploader)
    return nil if image_uploader.blank?

    url = image_uploader.url
    return url if url.start_with?("http")

    "#{request.base_url}#{url}"
  end

  def set_marche_meta_tags(marche)
    image = asset_url("default_ogp.png")
    if marche.images.present? && marche.images.first.present?
      # full_image_url ヘルパーを使用して絶対URLを生成
      image = full_image_url(marche.images.first) || image
    end

    title = "#{marche.title}｜地域マルシェ情報"

    # 説明文の設定（長すぎる場合は省略）
    description = marche.description.to_s.truncate(100)

    # meta-tags の設定
    set_meta_tags(
      title: title,
      description: description,
      og: {
        title: title,
        description: description,
        image: image,
        type: "website",
        url: request.original_url
      },
      twitter: {
        card: "summary_large_image",
        title: title,
        description: description,
        image: image
      }
    )
  end
end
