module ApplicationHelper

  def site_name
    "Friend420"
  end

  def site_url
    if Rails.env.production?
      "http://www.friend420.com"
    else
      "http://localhost:3000"
    end
  end

  def meta_author
    # Change the value below between the quotes.
    "Friend420 Team"
  end

  def meta_description
    "Seattle's best medical marijuana coupons"
  end

  def meta_keywords
    ""
  end

  def full_title(page_title)
    if page_title.empty?
      site_name
    else
      "#{page_title} | #{site_name}"
    end
  end

end
