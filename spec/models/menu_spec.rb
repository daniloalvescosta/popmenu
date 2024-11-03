require 'rails_helper'

RSpec.describe Menu, type: :model do
  it { should validate_presence_of(:title) }
end
