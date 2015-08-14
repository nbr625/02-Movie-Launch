require 'rails_helper'

RSpec.describe "prints/index", type: :view do
  before(:each) do
    assign(:prints, [
      Print.create!(
        :name => "Name",
        :description => "",
        :pledge => 1,
        :rating => 2,
        :category => "Category"
      ),
      Print.create!(
        :name => "Name",
        :description => "",
        :pledge => 1,
        :rating => 2,
        :category => "Category"
      )
    ])
  end

  it "renders a list of prints" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
