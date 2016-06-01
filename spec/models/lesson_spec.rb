require 'rails_helper'

RSpec.describe Lesson, type: :model do
  let(:l) {l=Lesson.create!(name: "Lesson 1")}

  it "should have two contents" do
  	l.contents.create!(name: "Content 1")
  	l.contents.create!(name: "Content 2")
  	expect(l.contents.count).to eq(2)
  end

end
