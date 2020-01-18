require 'rails_helper'

describe "the add a review process" do
  it "adds a review to a product" do
    project = Product.create({name: "dope thing", cost: 5, country_of_origin: "USA" })
    visit products_path
    click_link 'Dope Thing'
    click_link 'Review this product'
    fill_in 'Author', :with => 'Sandy Sally'
    fill_in 'Rating', :with => 5
    fill_in 'Content body', :with => "USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA"
    click_on 'Create Review'
    expect(page).to have_content 'Review successfully added!'
    expect(page).to have_content('Sandy Sally')
  end

  it "gives an error when no name is entered" do
    project = Product.create({name: "dope thing", cost: 5, country_of_origin: "USA" })
    visit products_path
    click_link 'Dope Thing'
    click_link 'Review this product'
    fill_in 'Author', :with => ''
    fill_in 'Rating', :with => 5
    fill_in 'Content body', :with => "USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA"
    click_on 'Create Review'
    expect(page).to have_content "Author can't be blank"
  end
end
