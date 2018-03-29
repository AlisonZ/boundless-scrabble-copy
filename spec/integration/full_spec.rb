require "spec_helper"

describe "scrabble application" do
  def run_application
    output = `bin/scrabble Boundless`
    output.chomp
  end

  it "should do be able to output my input" do
    expect(run_application).to eq("Your input is: Boundless")
  end
end
