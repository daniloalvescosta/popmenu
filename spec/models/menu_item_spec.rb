require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it { should validate_presence_of(:title) }
end
