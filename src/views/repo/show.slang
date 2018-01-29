h1 Show Repo
p = repo.name
p = repo.source
p = repo.user
p = repo.stars
p = repo.weekly_clones
p
  == link_to("back", "/repos", class: "btn btn-success btn-xs")
  == link_to("edit", "/repos/#{repo.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/repos/#{repo.id}?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
