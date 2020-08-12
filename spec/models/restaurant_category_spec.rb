require 'rails_helper'

RSpec.describe RestaurantCategory, type: :model do
  subject(:restaurant_category) { FactoryBot.build(:restaurant_category) }

  #validation_test
  describe ".restaurant_category_name_presence" do
    context "restaurant_category name is present" do
      it "restaurant_category having a name is valid" do
        expect(subject).to be_valid
      end
    end
    context "restaurant_category name is not present" do
      it "restaurant_category having no name is invalid" do
        subject.name = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".restaurant_category_name_length" do
    context "with valid restaurant_category name length" do
      it "restaurant_category having name of length within 2 and 35 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid restaurant_category name length" do
      it "restaurant_category not having name of length within 2 and 35 characters is invalid" do
        subject.name = "k"
        expect(subject).not_to be_valid
      end 
    end
  end

  describe ".restaurant_category_name_format" do
    context "with valid format of restaurant_categoryname" do
      it "restaurant_category containg name with uppercase, lowercase letters and blank spaces is valid" do
        expect(subject).to be_valid
      end
    end
    context "with not valid format of restaurant_categoryname" do
      it "restaurant_category containg name with digits and special characters is invalid" do
        subject.name = "karan123"
        expect(subject).not_to be_valid
      end
    end
  end

  #association_test
  describe "has_many :restaurants" do
    it { is_expected.to have_many :restaurants }  
  end
end
