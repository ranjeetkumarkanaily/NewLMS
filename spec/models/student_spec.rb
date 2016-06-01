require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "student nextContent" do 
	before(:example) do
	    @l = Lesson.create!(name: "Lesson 1")
		@c1 = @l.contents.create!(name: "Content 1")
		@c2 = @l.contents.create!(name: "Content 2")
		@c3 = @l.contents.create!(name: "Content 3")

		@l1 = Lesson.create!(name: "Lesson 2")
		@c11 = @l1.contents.create!(name: "Content 1")
		@c12 = @l1.contents.create!(name: "Content 2")
		@c13 = @l1.contents.create!(name: "Content 3")

		@s = Student.create!(name: "Student 1")
	end

	it "should match first lesson's first content" do
		expect(@s.nextContent).to eq([@l.id, @l.contents.first.id])
	end

	it "should match first lesson's second content" do
		@s.progress = "L#{@l.id} P1"
		expect(@s.nextContent).to eq([@l.id, @l.contents[1].id])
	end

	it "should match first lesson's third content" do
		@s.progress = "L#{@l.id} P1"
		@s.progress = "L#{@l.id} P2"
		expect(@s.nextContent).to eq([@l.id, @l.contents[2].id])
	end

	it "should match second lesson's first content" do
		@s.progress = "L#{@l.id} P1"
		@s.progress = "L#{@l.id} P2"
		@s.progress = "L#{@l.id} P3"
		expect(@s.nextContent).to eq([@l1.id, @l1.contents[0].id])
	end	

	it "should match second lesson's second content" do
		@s.progress = "L#{@l.id} P1"
		@s.progress = "L#{@l.id} P2"
		@s.progress = "L#{@l.id} P3"
		@s.progress = "L#{@l1.id} P1"
		expect(@s.nextContent).to eq([@l1.id, @l1.contents[1].id])
	end	

	it "should match second lesson's third content" do
		@s.progress = "L#{@l.id} P1"
		@s.progress = "L#{@l.id} P2"
		@s.progress = "L#{@l.id} P3"
		@s.progress = "L#{@l1.id} P1"
		@s.progress = "L#{@l1.id} P2"
		expect(@s.nextContent).to eq([@l1.id, @l1.contents[2].id])
	end	

	it "should match all content complted" do
		@s.progress = "L#{@l.id} P1"
		@s.progress = "L#{@l.id} P2"
		@s.progress = "L#{@l.id} P3"
		@s.progress = "L#{@l1.id} P1"
		@s.progress = "L#{@l1.id} P2"
		@s.progress = "L#{@l1.id} P3"
		expect(@s.nextContent).to eq("All Completed")
	end	
	end
end
