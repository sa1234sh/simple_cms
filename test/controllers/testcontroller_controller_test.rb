require 'test_helper'

class TestcontrollerControllerTest < ActionDispatch::IntegrationTest
  test "should get exam" do
    get testcontroller_exam_url
    assert_response :success
  end

end
