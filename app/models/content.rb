class Content < ActiveRecord::Base
	belongs_to :lesson

	default_scope { order(created_at: :asc) }
end
