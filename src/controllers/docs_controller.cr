class DocsController < ApplicationController
  def show
    repo_params = params.select(%w{provider owner name}).values
    version_params = params.select(%w{ref_type ref}).values
    where_params = repo_params + version_params
    doc_path = params["doc_path"]

    repo = RepoVesion.first(<<~sql
      JOIN repos ON repo_versions.repo_id = repos.id
      WHERE repos.provider = ?
      AND repos.owner = ?
      AND repos.name = ?
      AND repo_versions.ref_type = ?
      AND repo_versions.ref = ?
    sql, where_params)

    if repo_version && repo_version.indexed
      render("show.slang")
    elsif repo_version.unresolved
      flash["warning"] = "#{params["ref_type"]} not found #{params["name"]}"
      redirect_to "/#{repo_params.join('/')}"
    else
      if !repo_version RepoWorker.perform(repo)
      render("processing.slang")
    end
  end
end
