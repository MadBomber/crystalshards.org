div.row
  div.col-sm-11
    h2 Repo Versions
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/repo_versions/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Repo_id
        th Reftype
        th Ref
        th Spec
        th Documentation
        th Actions
    tbody
    - repo_versions.each do |repo_version|
      tr
        td = repo_version.repo_id
        td = repo_version.reftype
        td = repo_version.ref
        td = repo_version.spec
        td = repo_version.documentation
        td
          span
            == link_to("read", "/repo_versions/#{repo_version.id}", class: "btn btn-success btn-xs")
            == link_to("edit", "/repo_versions/#{repo_version.id}/edit", class: "btn btn-success btn-xs")
            == link_to("delete", "/repo_versions/#{ repo_version.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
