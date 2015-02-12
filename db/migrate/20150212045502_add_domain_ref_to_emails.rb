class AddDomainRefToEmails < ActiveRecord::Migration
  def change
    add_reference :emails, :domain, index: true
    add_foreign_key :emails, :domains, on_delete: :cascade
  end
end
