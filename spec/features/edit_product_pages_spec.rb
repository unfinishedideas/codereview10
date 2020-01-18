require 'rails_helper'

describe "the edit product process" do
  it "edits a product name" do
    project = Product.create({name: "dope thing", cost: 5, country_of_origin: "USA" })
    visit products_path
    click_link('Dope Thing')
    click_link 'Edit properties'
    fill_in 'Name', :with => 'The Juicinator 3000'
    click_on 'Update Product'
    expect(page).to have_content 'Product successfully updated!'
    expect(page).to have_content 'The Juicinator 3000'
  end

  it "gives an error when no name is entered" do
    project = Product.create({name: "dope thing", cost: 5, country_of_origin: "USA" })
    visit products_path
    click_link('Dope Thing')
    click_link 'Edit properties'
    fill_in 'Name', :with => ''
    click_on 'Update Product'
    expect(page).to have_content "Name can't be blank"
  end
end
