div.row
  div.col-sm-11
    h2 Contributors
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/contributors/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Username
        th Provider
        th Actions
    tbody
    - contributors.each do |contributor|
      tr
        td = contributor.username
        td = contributor.provider
        td
          span
            == link_to("read", "/contributors/#{contributor.id}", class: "btn btn-success btn-xs")
            == link_to("edit", "/contributors/#{contributor.id}/edit", class: "btn btn-success btn-xs")
            == link_to("delete", "/contributors/#{ contributor.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
