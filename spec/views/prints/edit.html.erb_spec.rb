require 'rails_helper'

RSpec.describe "prints/edit", type: :view do
  before(:each) do
    @print = assign(:print, Print.create!(
      :name => "MyString",
      :description => "",
      :pledge => 1,
      :rating => 1,
      :category => "MyString"
    ))
  end

  it "renders the edit print form" do
    render

    assert_select "form[action=?][method=?]", print_path(@print), "post" do

      assert_select "input#print_name[name=?]", "print[name]"

      assert_select "input#print_description[name=?]", "print[description]"

      assert_select "input#print_pledge[name=?]", "print[pledge]"

      assert_select "input#print_rating[name=?]", "print[rating]"

      assert_select "input#print_category[name=?]", "print[category]"
    end
  end
end
