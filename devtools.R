#yse to create a Rproject
devtools::create("baap")



devtools::document()
devtools::load_all()
devtools::check()
rm(list = c(""))

correlations <- psych::polychoric(data, correct = 0)

data<-BAAP::Rotter[,11:23]
fa.5F.1 <- psych::fa(r=correlations$rho, nfactors = 5, fm= "pa",rotate ="varimax",
esiduals = TRUE, SMC = TRUE, n.obs =428)
able <- fac.tab(fa.5F.1, .3)

usethis::browse_github()

?username?
