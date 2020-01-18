describe "the add a review process" do
  it "edits a review product" do
    product = Product.create({name: "dope thing", cost: 5, country_of_origin: "USA" })
    review = Review.create({author: "Sandy Sally", rating: 5, content_body: "USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA", product_id: product.id})
    visit products_path
    click_link 'Dope Thing'
    click_link 'Sandy Sally'
    click_link 'Edit review'
    fill_in 'Author', :with => 'Standup Sally'
    click_on 'Update Review'
    expect(page).to have_content 'Review successfully updated!'
    expect(page).to have_content('Standup Sally')
  end

  it "gives an error when no name is entered" do
    product = Product.create({name: "dope thing", cost: 5, country_of_origin: "USA" })
    review = Review.create({author: "Sandy Sally", rating: 5, content_body: "USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA USA", product_id: product.id})
    visit products_path
    click_link 'Dope Thing'
    click_link 'Sandy Sally'
    click_link 'Edit review'
    fill_in 'Author', :with => ''
    click_on 'Update Review'
    expect(page).to have_content "Author can't be blank"
  end
end
