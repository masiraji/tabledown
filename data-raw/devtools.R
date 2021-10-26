# to create a Rproject
devtools::create("baap")

devtools::document()
devtools::load_all()
devtools::check()
usethis::browse_github()
rm(list = c("ac.tab"))

#packgedown
pkgdown::build_site(examples = TRUE)
pkgdown::build_home(pkg = ".", override = list(), preview = NA, quiet = TRUE)


#Badges
usethis::use_cran_badge()
usethis::use_github_links()
badgecreatr::badge_cran_downloads("baap", period = NULL)
badgecreatr::badge_thanks_md()
badgecreatr::badge_license()
usethis::use_lifecycle_badge("stable")
usethis::use_lifecycle()

#Usethis
#Add file to project ignore
usethis::use_build_ignore(c("data-raw", "docs", "index.Rmd, packages.bib","package.fig","THANKS.md"))

#Get vaccinated
usethis::git_vaccinate()
usethis::use_build_ignore(".github")
#Spelling
usethis::use_spell_check()

#Use magrittr's pipe in your package
usethis::use_pipe()


#Create News.md
usethis::use_news_md()
#To automate news.md
devtools::install_github("cynkra/fledge")

#regularly use this to have a version control change log

fledge::bump_version()










