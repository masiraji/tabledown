packrat::init()
# Run these from the R console

# Check that the `usethis` package is installed. If not:
install.packages("usethis")

# Create new package. Directory must not exist.
# This also creates a new RStudio project.
usethis::create_package("monash")

# Run this code after opening the new package in RStudio

# Set up the data-raw directory and data processing script
# You can use any name you want for your data
usethis::use_data_raw(name = 'PsychoData')

# This script in the R directory will contain the documentation.
# You can use any name you want.
file.create("R/data.R")

# Initialize git repository (optional)
usethis::use_git()

#Document your pack
install.packages("sinew")

sinew::makeOxygen(LEBA, add_fields = "source")

