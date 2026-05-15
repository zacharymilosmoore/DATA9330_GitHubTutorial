library(usethis)
usethis::use_git_config(user.name = "zacharymilosmoore", user.email = "zacharymilosmoore@gmail.com")
usethis::create_github_token()
gitcreds::gitcreds_set()
