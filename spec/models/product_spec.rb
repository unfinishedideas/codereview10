require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }
  it { should validate_length_of(:name).is_at_most(100) }
  it { should validate_length_of(:country_of_origin).is_at_least(3) }
  it { should validate_numericality_of(:cost) }
end

describe Product do
  it("titleizes the name of an project") do
    project = Product.create({name: "dope thing", cost: 5, country_of_origin: "USA" })
    expect(project.name()).to(eq("Dope Thing"))
  end
end
