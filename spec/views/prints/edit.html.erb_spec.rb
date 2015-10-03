require 'rails_helper'

RSpec.describe "prints/edit", type: :view do
  before(:each) do
    @print = assign(:print, Print.create!())
  end

  it "renders the edit print form" do
    render

    assert_select "form[action=?][method=?]", print_path(@print), "post" do
    end
  end
end
