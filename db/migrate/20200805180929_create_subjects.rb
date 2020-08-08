class CreateSubjects < ActiveRecord::Migration[5.0]
  def up
    create_table :subjects do |t|

    	t.column "name" , :string
    	t.integer "position"
    	t.column "visible"  , :boolean ,:default => false

      t.timestamps
    end
  end


  def down

  	drop_table :subjects

  end


end
