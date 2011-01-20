require 'spec_helper'

class Car < ActiveRecord::Base
  validates_with PostgresqlValidations::LimitValidator
end

describe "PostgreSQL validations" do
  
  context "for int fields (failure, min value)" do
    before do
      @car = Car.new(:wheels => -2147483649)
    end
  
    it "should not throw an error" do
      lambda {
        @car.save!
      }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should mark the field as invalid" do
      @car.valid?
      @car.errors[:wheels].should_not be_empty
    end
  end
  
  context "for int fields (success, min value)" do
    before do
      @car = Car.new(:wheels => -2147483648)
    end
  
    it "should not throw an error" do
      lambda {
        @car.save!
      }.should_not raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should mark the field as invalid" do
      @car.valid?
      @car.errors[:wheels].should be_empty
    end
  end
  
  context "for int fields (failure, max value)" do
    before do
      @car = Car.new(:wheels => 2147483648)
    end
  
    it "should not throw an error" do
      lambda {
        @car.save!
      }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should mark the field as invalid" do
      @car.valid?
      @car.errors[:wheels].should_not be_empty
    end
  end
  
  context "for int fields (success, max value)" do
    before do
      @car = Car.new(:wheels => 2147483647)
    end
  
    it "should not throw an error" do
      lambda {
        @car.save!
      }.should_not raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should mark the field as invalid" do
      @car.valid?
      @car.errors[:wheels].should be_empty
    end
  end
  
  context "for string fields (failure)" do
    before do
      @car = Car.new(:brand => (1..256).collect { 'a' })
    end
  
    it "should not throw an error" do
      lambda {
        @car.save!
      }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should mark the field as invalid" do
      @car.valid?
      @car.errors[:brand].should_not be_empty
    end
  end
  
  context "for string fields (success)" do
    before do
      @car = Car.new(:brand => (1..255).collect { 'a' })
    end
  
    it "should not throw an error" do
      lambda {
        @car.save!
      }.should_not raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should mark the field as invalid" do
      @car.valid?
      @car.errors[:brand].should be_empty
    end
  end
  
end