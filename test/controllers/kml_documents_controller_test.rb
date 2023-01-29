require "test_helper"

class KmlDocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kml_documents_index_url
    assert_response :success
  end
end
