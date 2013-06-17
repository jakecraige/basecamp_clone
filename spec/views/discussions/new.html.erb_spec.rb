require 'spec_helper'

describe "discussions/new" do
  before(:each) do
    assign(:discussion, stub_model(Discussion,
      :title => "MyString",
      :message => "MyText",
      :project_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new discussion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", discussions_path, "post" do
      assert_select "input#discussion_title[name=?]", "discussion[title]"
      assert_select "textarea#discussion_message[name=?]", "discussion[message]"
      assert_select "input#discussion_project_id[name=?]", "discussion[project_id]"
      assert_select "input#discussion_user_id[name=?]", "discussion[user_id]"
    end
  end
end
