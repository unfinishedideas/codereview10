require 'rails_helper'

describe Review do
  it { should belong_to(:product) }

  it { should validate_presence_of :author }
  it { should validate_presence_of :rating }
  it { should validate_presence_of :content_body }
  it { should validate_length_of(:author).is_at_most(100) }
  it { should validate_numericality_of(:rating) }
end

# describe Review do
#   it("titleizes the name of an review") do
#     review = Review.create({author: "a dummy reVIEweR", rating: 5, content_body: "USA USA USA USA USA" })
#     expect(review.author()).to(eq("A Dummy Reviewer"))
#   end
# end
