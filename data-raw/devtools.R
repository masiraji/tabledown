# to create a Rproject
#devtools::create("baap")

devtools::document()
devtools::load_all()
devtools::check()
rm(list = c("ac.tab"))

pkgdown::build_site()
usethis::browse_github()


usethis::use_lifecycle_badge("stable")




