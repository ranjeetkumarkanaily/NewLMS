class Lesson < ActiveRecord::Base
	has_many :contents

	default_scope { order(created_at: :ASC) }
end