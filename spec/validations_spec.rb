require 'spec_helper'

class Car < ActiveRecord::Base
  validates_with PostgresqlValidations::LimitValidator
end

describe "PostgreSQL validations" do
  
  context "for int fields (failure, min value)" do
    before do
      @car = Car.new(wheels: -2147483649)
    end
  
    it "should not throw an error" do
      expect {
        @car.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should mark the field as invalid" do
      @car.valid?
      expect(@car.errors[:wheels]).to_not be_empty
    end
  end
  
  context "for int fields (success, min value)" do
    before do
      @car = Car.new(wheels: -2147483648)
    end
  
    it "should not throw an error" do
      expect {
        @car.save!
      }.to_not raise_error
    end
    
    it "should mark the field as invalid" do
      @car.valid?
      expect(@car.errors[:wheels]).to be_empty
    end
  end
  
  context "for int fields (failure, max value)" do
    before do
      @car = Car.new(wheels: 2147483648)
    end
  
    it "should not throw an error" do
      expect {
        @car.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should mark the field as invalid" do
      @car.valid?
      expect(@car.errors[:wheels]).to_not be_empty
    end
  end
  
  context "for int fields (success, max value)" do
    before do
      @car = Car.new(wheels: 2147483647)
    end
  
    it "should not throw an error" do
      expect {
        @car.save!
      }.to_not raise_error
    end
    
    it "should mark the field as invalid" do
      @car.valid?
      expect(@car.errors[:wheels]).to be_empty
    end
  end
  
  context "for string fields (failure)" do
    before do
      @car = Car.new(brand: (1..256).collect { 'a' })
    end
  
    it "should not throw an error" do
      expect {
        @car.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should mark the field as invalid" do
      @car.valid?
      expect(@car.errors[:brand]).to_not be_empty
    end
  end
  
  context "for string fields (success)" do
    before do
      @car = Car.new(brand: (1..255).collect { 'a' }.join)
    end
  
    it "should not throw an error" do
      expect {
        @car.save!
      }.to_not raise_error
    end
    
    it "should mark the field as invalid" do
      @car.valid?
      expect(@car.errors[:brand]).to be_empty
    end
  end
  
end
