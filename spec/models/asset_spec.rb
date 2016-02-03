require 'rails_helper'

RSpec.describe Asset, type: :model do

  it { should have_attached_file(:file) }
  it { should validate_attachment_presence(:file) }

end
