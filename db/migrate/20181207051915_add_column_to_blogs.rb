class AddColumnToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_reference :blogs, :user,  index: true, foreign_key: true
  end
end
