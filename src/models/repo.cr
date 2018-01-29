require "granite_orm/adapter/pg"

class Repo < Granite::ORM::Base
  adapter pg
  table_name repos

  field provider : String
  field owner : String
  field name : String
  field stars : Int32
  field weekly_clones : Int32
  timestamps
end
