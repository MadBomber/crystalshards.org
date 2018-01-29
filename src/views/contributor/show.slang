h1 Show Contributor
p = contributor.username
p = contributor.provider
p
  == link_to("back", "/contributors", class: "btn btn-success btn-xs")
  == link_to("edit", "/contributors/#{contributor.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/contributors/#{contributor.id}?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
