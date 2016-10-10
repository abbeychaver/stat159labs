source("../functions/range_value.R")
context("Test for range value")
test_that("range works as expected", {
  x <- c(1, 2, 3, 4, 5)
  
  expect_equal(range_value(x), 4)
  expect_length(range_value(x), 1)
  expect_type(range_value(x), 'double')
  
  y <- c(1, 2, 3, 4, NA)
  
  expect_length(range_value(y), 1)
  # expect_equal(range_value(y, FALSE), NA_real_)
  expect_equal(range_value(y), 3)
  
  z <- c(TRUE, FALSE, TRUE)
  expect_length(range_value(z), 1)
  expect_type(range_value(z), 'integer')
  expect_length(range_value(z), 1L)
  
  w <- letters[1:5]
  expect_error(range_value(w), "non-numeric argument to binary operator")

})

source("../functions/missing_values.R")
context("Test for missing value")
test_that("missing value works as expected", {
  y <- c(1, 2, 3, 4, NA)
  
  expect_length(missing_values(y), 1)
  expect_type(double(missing_values(y)), 'double')
  expect_gte(missing_values(y), 0)
})
