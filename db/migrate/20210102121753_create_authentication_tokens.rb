class CreateAuthenticationTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :authentication_tokens do |t|
      t.string :token, null: false
      t.references :user, foreign_key: true, null: false
      t.datetime :expires_at, null: false

      t.timestamps
    end

    add_index :authentication_tokens, :token, unique: true
  end
end
