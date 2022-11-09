
require "rails_helper"

# First test example. Should fail and throw error
# RSpec.describe "Should Fail: The math below is wrong..." do
#     it "should equal 42 but we said 43" do
#         expect(6 * 7).to eq(43)
#     end
# end

# This example test should pass
RSpec.describe "The math below is right..." do
    it "should equal 42" do
        expect(6 * 7).to eq(42)
    end
end

# This example test should pass. It expects an empty string to 
RSpec.describe "hello spec" do
  # ...
  describe String do
    let(:string) { String.new }
    it "should provide an empty string" do
      expect(string).to eq("")
    end
  end
 end