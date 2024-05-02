install.packages("devtools")
# to create a Rproject
#devtools::create("MONASH")

devtools::document()
devtools::load_all()
devtools::check()
usethis::browse_github()
rm(list = c("ac.tab"))

#packgedown
pkgdown::init_site()
pkgdown::build_site()
pkgdown::build_home(pkg = ".", override = list(), preview = NA, quiet = TRUE)


#Badges
usethis::use_cran_badge()
usethis::use_github_links()
badgecreatr::badge_cran_downloads("tabledown", period = NULL)
badgecreatr::badge_thanks_md()
badgecreatr::badge_license()
usethis::use_lifecycle_badge("stable")
usethis::use_lifecycle()
badgecreatr::badge_last_change(location = ".")

#Usethis
#Add file to project ignore
usethis::use_build_ignore(c( "THANKS.md", "docs","LICENSE.md", "images", "cran-comments.md", ".DS_Store",
                             "lastMiKTeXException"))
#Get vaccinated
usethis::git_vaccinate()
usethis::use_build_ignore(".github")
#Spelling
usethis::use_spell_check()
devtools::check()

#Use magrittr's pipe in your package
usethis::use_pipe()


#Create News.md
usethis::use_news_md()
#To automate news.md
devtools::install_github("cynkra/fledge")

#regularly use this to have a version control change log

fledge::bump_version()

fledge::finalize_version()
usethis::use_github()



#check for cran
devtools::check_rhub()

devtools::check()
#Use vintage
usethis::use_vignette()

##License a package
usethis::use_mit_license()
usethis::use_gpl_license()



#Cran Comments
use_cran_comments()


#Github links
usethis::use_github_links()

#Create vintages
usethis::use_vignette("my-vignette")

remotes::install_github("masiraji/monashthesisdown")

#creating Template
usethis::use_rmarkdown_template("monashthesis")

psychoshiny::psychoshiny()


#Releasing the package in CRAN

devtools::check_rhub()

devtools::release()
devtools::check_win_devel()

fledge::bump_version("major")
#change the bump_version type before doing edits

#Resubmit
devtools::submit_cran()


#Tag the version after releasing
fledge::tag_version()


# Create GitHub release
usethis::use_github_release()

pack <- available.packages()
pack["ggplot2","Imports"]



#Use this two for the updated page deployment (Do not use the previous method)
usethis::use_github_action("check-standard")


usethis::use_pkgdown_github_pages()


#Fesibility check
devtools::check_rhub()

# Update version number
usethis::use_version()
