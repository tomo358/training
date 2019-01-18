class AddColumToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_reference :blogs, :comment, index: true, foreign_key: true
  end
end
