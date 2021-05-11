require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      name: "MyString",
      description: "MyText",
      price: "9.99",
      vegetarian: false,
      vegan: false,
      available: false,
      featured: false
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "textarea[name=?]", "product[description]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[vegetarian]"

      assert_select "input[name=?]", "product[vegan]"

      assert_select "input[name=?]", "product[available]"

      assert_select "input[name=?]", "product[featured]"
    end
  end
end
