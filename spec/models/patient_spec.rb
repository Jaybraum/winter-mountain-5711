require 'rails_helper'

RSpec.describe Patient, type: :model do
  it {should have_many(:appointments)}
  it {should have_many(:doctors).through(:appointments)}
end
