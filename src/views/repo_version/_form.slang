- if repo_version.errors
  ul.errors
  - repo_version.errors.each do |error|
    li = error.to_s

== form(action: "/repo_versions/#{repo_version.id.to_s}", method: repo_version.id ? :patch : :post) do
  == csrf_tag
  div.form-group
  == text_field(name: "repo_id", value: repo_version.repo_id, placeholder: "Repo_id", class: "form-control")
  div.form-group
  == text_field(name: "reftype", value: repo_version.reftype, placeholder: "Reftype", class: "form-control")
  div.form-group
  == text_field(name: "ref", value: repo_version.ref, placeholder: "Ref", class: "form-control")
  div.form-group
  == text_field(name: "spec", value: repo_version.spec, placeholder: "Spec", class: "form-control")
  div.form-group
  == text_field(name: "documentation", value: repo_version.documentation, placeholder: "Documentation", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/repo_versions", class: "btn btn-default btn-xs")
