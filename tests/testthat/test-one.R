test_that("Function one works", {
  expect_equal(one(1), 2)
  expect_equal(one(3), 4)
  expect_error(one('a'))
})
