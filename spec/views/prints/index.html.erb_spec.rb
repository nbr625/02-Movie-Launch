require 'rails_helper'

RSpec.describe "prints/index", type: :view do
  before(:each) do
    assign(:prints, [
      Print.create!(),
      Print.create!()
    ])
  end

  it "renders a list of prints" do
    render
  end
end
