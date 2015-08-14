require 'rails_helper'

RSpec.describe "prints/show", type: :view do
  before(:each) do
    @print = assign(:print, Print.create!(
      :name => "Name",
      :description => "",
      :pledge => 1,
      :rating => 2,
      :category => "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Category/)
  end
end
