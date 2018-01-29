div.row
  div.col-sm-11
    h2 Repos
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/repos/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Source
        th User
        th Stars
        th Weekly_clones
        th Actions
    tbody
    - repos.each do |repo|
      tr
        td = repo.name
        td = repo.source
        td = repo.user
        td = repo.stars
        td = repo.weekly_clones
        td
          span
            == link_to("read", "/repos/#{repo.id}", class: "btn btn-success btn-xs")
            == link_to("edit", "/repos/#{repo.id}/edit", class: "btn btn-success btn-xs")
            == link_to("delete", "/repos/#{ repo.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
