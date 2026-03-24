require 'test_helper'

describe "jQuery Raty integration" do
  it "pulls in jquery.raty.js" do
    visit '/assets/jquery.raty.js'
    assert_equal(page.status_code, 200)
    assert(page.text.include? "$.fn.raty.defaults")
  end

  it "pulls in jquery.raty.min.js" do
    visit '/assets/jquery.raty.min.js'
    assert_equal(page.status_code, 200)
    assert(page.text.size < 10_000)
  end

  it "pulls in various images" do
    root = File.expand_path('../../..', __FILE__)
    images = Dir.glob("#{root}/vendor/**/*.png")
    assert(images.length > 0)

    images.each do |image|
      visit "/assets/jquery.raty/#{File.basename image}"
      assert_equal(page.status_code, 200)
    end
  end

end
