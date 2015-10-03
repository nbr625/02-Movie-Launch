require 'rails_helper'

RSpec.describe "prints/new", type: :view do
  before(:each) do
    assign(:print, Print.new())
  end

  it "renders new print form" do
    render

    assert_select "form[action=?][method=?]", prints_path, "post" do
    end
  end
end
