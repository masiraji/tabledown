# to create a Rproject
#devtools::create("baap")

devtools::document()
devtools::load_all()
devtools::check()
rm(list = c("ac.tab"))

pkgdown::build_site()
usethis::browse_github()


usethis::use_lifecycle_badge("stable")
usethis::use_lifecycle()

usethis::use_github_action_check_standard()
usethis::use_cran_badge()
usethis::use_github_links()



usethis::use_build_ignore("index.Rmd")

#Get vaccinated
usethis::git_vaccinate()


usethis::use_spell_check()

#Use magrittr's pipe in your package
usethis::use_pipe()


#Create News
usethis::use_news_md()



usethis::use_circleci_badge()


usethis::use_github_action_check_standard(
  save_as = "R-CMD-check.yaml",
  ignore = TRUE,
  open = FALSE
)


