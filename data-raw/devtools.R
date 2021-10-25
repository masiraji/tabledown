# to create a Rproject
#devtools::create("baap")

devtools::document()
devtools::load_all()
devtools::check()
rm(list = c("ac.tab"))

pkgdown::build_site()
usethis::browse_github()


usethis::use_lifecycle_badge("experimental")


usethis::use_github_action_check_standard()
usethis::use_cran_badge()
usethis::use_github_links()

