require "rails_helper"

RSpec.describe "As a visitor" do
  describe "When I visit '/professors'," do
    it "I see a list of professors with the following information: Name, Age, Specialty" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

      visit "/professors"

      expect(page).to have_content(snape.name)
      expect(page).to have_content(snape.age)
      expect(page).to have_content(snape.specialty)
    end
    it "all information is listed alphabetically" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
      
      visit "/professors"
      expect(page).to have_content(lupin.name)
      expect(page).to have_content(hagarid.name)
      expect(page).to have_content(snape.name)
    end
  end
end