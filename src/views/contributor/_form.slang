- if contributor.errors
  ul.errors
  - contributor.errors.each do |error|
    li = error.to_s

== form(action: "/contributors/#{contributor.id.to_s}", method: contributor.id ? :patch : :post) do
  == csrf_tag
  div.form-group
  == text_field(name: "username", value: contributor.username, placeholder: "Username", class: "form-control")
  div.form-group
  == text_field(name: "provider", value: contributor.provider, placeholder: "Provider", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/contributors", class: "btn btn-default btn-xs")
