require 'rails/generators/active_record'

module Douglas
  module Generators
    class TableGenerator < ::Rails::Generators::NamedBase
      include ::Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)
      desc 'Create migration for for a table that should be stamped'

      def self.next_migration_number(dirname)
        next_migration_number = current_migration_number(dirname) + 1
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end

      def copy_douglas_migration
        migration_template 'migration.rb', "db/migrate/add_created_by_and_updated_by_to_#{table_name}.rb", migration_version: migration_version
      end

      def migration_version
        if rails5?
          "[#{::Rails::VERSION::MAJOR}.#{::Rails::VERSION::MINOR}]"
        end
      end

      def rails5?
        ::Rails.version.start_with? '5'
      end
    end
  end
end
