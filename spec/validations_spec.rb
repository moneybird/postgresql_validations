require 'spec_helper'

class Car < ActiveRecord::Base
  validates_with PostgresqlValidations::LimitValidator
end

describe "PostgreSQL validations" do
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
      @car = Car.new(brand: "a" * 255)
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

  it "allows long strings if no limit is specified" do
    car = Car.new(serial_no: "a" * 9999)

    expect(car.errors[:serial_no]).to be_empty
  end
end
