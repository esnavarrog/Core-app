require "application_system_test_case"

class GirlsTest < ApplicationSystemTestCase
  setup do
    @girl = girls(:one)
  end

  test "visiting the index" do
    visit girls_url
    assert_selector "h1", text: "Girls"
  end

  test "creating a Girl" do
    visit girls_url
    click_on "New Girl"

    click_on "Create Girl"

    assert_text "Girl was successfully created"
    click_on "Back"
  end

  test "updating a Girl" do
    visit girls_url
    click_on "Edit", match: :first

    click_on "Update Girl"

    assert_text "Girl was successfully updated"
    click_on "Back"
  end

  test "destroying a Girl" do
    visit girls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Girl was successfully destroyed"
  end
end
