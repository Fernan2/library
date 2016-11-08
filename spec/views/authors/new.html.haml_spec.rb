require 'rails_helper'

RSpec.describe "authors/new", type: :view do
  before(:each) do
    assign(:author, Author.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :city => "MyString",
      :address => "MyString",
      :website => "MyString"
    ))
  end

  it "renders new author form" do
    render

    assert_select "form[action=?][method=?]", authors_path, "post" do

      assert_select "input#author_first_name[name=?]", "author[first_name]"

      assert_select "input#author_last_name[name=?]", "author[last_name]"

      assert_select "input#author_email[name=?]", "author[email]"

      assert_select "input#author_phone[name=?]", "author[phone]"

      assert_select "input#author_city[name=?]", "author[city]"

      assert_select "input#author_address[name=?]", "author[address]"

      assert_select "input#author_website[name=?]", "author[website]"
    end
  end
end
