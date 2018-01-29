require "granite_orm/adapter/pg"

class Contributor < Granite::ORM::Base
  adapter pg
  table_name contributors

  field provider : String
  field username : String
  timestamps
end
