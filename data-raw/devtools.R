# to create a Rproject
devtools::create("baap")



devtools::document()
devtools::load_all()
devtools::check()
rm(list = c("ac.tab"))

pkgdown::build_site(examples = TRUE)
usethis::browse_github()


usethis::use_lifecycle_badge("stable")
usethis::use_lifecycle()


usethis::use_cran_badge()
usethis::use_github_links()
usethis::use_github_action_check_standard()

#Add file to project ignore
usethis::use_build_ignore("data-raw")

#Get vaccinated
usethis::git_vaccinate()


usethis::use_spell_check()

#Use magrittr's pipe in your package
usethis::use_pipe()


#Create News
usethis::use_news_md()
#To automate news.md
devtools::install_github("cynkra/fledge")

#regularly use this to have a version control change log

fledge::bump_version()






#testing the pack
usethis::use_testthat()

pkgdown::build_home(pkg = ".", override = list(), preview = NA, quiet = TRUE)

