test_that("Function two works", {
  expect_equal(two(1), 3)
  expect_equal(two(3), 5)
  expect_error(two('a'))
})
