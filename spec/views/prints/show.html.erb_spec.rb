require 'rails_helper'

RSpec.describe "prints/show", type: :view do
  before(:each) do
    @print = assign(:print, Print.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
