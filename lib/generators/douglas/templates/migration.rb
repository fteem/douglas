class AddCreatedByAndUpdatedByTo<%= table_name.camelize %> < ActiveRecord::Migration<%= migration_version %>
  def change
    add_column :<%= table_name %>, :created_by, :integer
    add_column :<%= table_name %>, :updated_by, :integer

    add_index :<%= table_name %>, :created_by
    add_index :<%= table_name %>, :updated_by
  end
end
