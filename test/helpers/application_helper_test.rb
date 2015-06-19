class ApplicationHelperTest < ActionView::TestCase
  include ApplicationHelper

  test "#flash_type_to_bootstrap returns danger if flash type is error" do
    assert_equal "danger", flash_type_to_bootstrap("error")
  end

  test "#flash_type_to_bootstrap returns success if flash type is notice" do
    assert_equal "success", flash_type_to_bootstrap("notice")
  end
end
