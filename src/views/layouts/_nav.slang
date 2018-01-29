- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/repos" ? "active" : ""
a class="nav-item #{active}" href="/repos" Repos
- active = context.request.path == "/contributors" ? "active" : ""
a class="nav-item #{active}" href="/contributors" Contributors
- active = context.request.path == "/repo_versions" ? "active" : ""
a class="nav-item #{active}" href="/repo_versions" Repo Versions
