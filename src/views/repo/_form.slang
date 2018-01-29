- if repo.errors
  ul.errors
  - repo.errors.each do |error|
    li = error.to_s

== form(action: "/repos/#{repo.id.to_s}", method: repo.id ? :patch : :post) do
  == csrf_tag
  div.form-group
  == text_field(name: "name", value: repo.name, placeholder: "Name", class: "form-control")
  div.form-group
  == text_field(name: "source", value: repo.source, placeholder: "Source", class: "form-control")
  div.form-group
  == text_field(name: "user", value: repo.user, placeholder: "User", class: "form-control")
  div.form-group
  == text_field(name: "stars", value: repo.stars, placeholder: "Stars", class: "form-control")
  div.form-group
  == text_field(name: "weekly_clones", value: repo.weekly_clones, placeholder: "Weekly_clones", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/repos", class: "btn btn-default btn-xs")
