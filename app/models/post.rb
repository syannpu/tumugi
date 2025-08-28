class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }

  belongs_to :user
  mount_uploaders :images, ImageUploader
  has_many :likes

  require 'uri'
  require 'cgi'

  def youtube_video_id
    return nil if youtube_url.blank?

    uri = URI.parse(youtube_url)

    if uri.host.include?("youtu.be")
      uri.path[1..] # "/abc123" → "abc123"
    else
      query_params = CGI.parse(uri.query || "")
      query_params["v"]&.first
    end
    rescue URI::InvalidURIError
    nil
  end
end
