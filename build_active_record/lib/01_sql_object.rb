require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @columns if @columns
    column_arr = DBConnection.execute2(<<-SQL).first
        SELECT
          *
        FROM
          #{self.table_name}
        LIMIT
          0
        SQL
      
      column_arr.map!(&:to_sym)
      @columns = column_arr
  end

  def self.finalize!

    self.columns.each do |col|
      define_method(col) {
        self.attributes[col]
      }
      define_method("#{col}=") do |value|
        self.attributes[col] = value
      end

    end

  end

  def self.table_name=(table_name)
    # ...4W
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name || self.to_s.tableize
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym

      if self.class.columns.include?(attr_name)
        send("#{attr_name}=",value)
      else
        raise ArgumentError.new "unknown attribute '#{attr_name}'"
      end

    end

  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
