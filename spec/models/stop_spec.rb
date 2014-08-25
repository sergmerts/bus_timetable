describe Stop do
  it { should validate_presence_of :number }
  it { should belong_to :station }
  it { should belong_to :line }
end
