require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :body => "MyText",
      :project_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do
      assert_select "textarea#comment_body[name=?]", "comment[body]"
      assert_select "input#comment_project_id[name=?]", "comment[project_id]"
      assert_select "input#comment_user_id[name=?]", "comment[user_id]"
    end
  end
end
