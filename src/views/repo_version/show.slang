h1 Show Repo Version
p = repo_version.repo_id
p = repo_version.reftype
p = repo_version.ref
p = repo_version.spec
p = repo_version.documentation
p
  == link_to("back", "/repo_versions", class: "btn btn-success btn-xs")
  == link_to("edit", "/repo_versions/#{repo_version.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/repo_versions/#{repo_version.id}?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
