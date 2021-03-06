require 'rails_helper'

RSpec.describe "channels/edit", type: :view do
  before(:each) do
    @channel = assign(:channel, Channel.create!(
      channel: "MyString"
    ))
  end

  it "renders the edit channel form" do
    render

    assert_select "form[action=?][method=?]", channel_path(@channel), "post" do

      assert_select "input[name=?]", "channel[channel]"
    end
  end
end
