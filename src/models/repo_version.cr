require "granite_orm/adapter/pg"

class RepoVersion < Granite::ORM::Base
  adapter pg
  table_name repo_versions

  field repo_id : String
  field ref_type : String
  field ref : String
  field spec : String
  field documentation : String
  timestamps
end
