test_that("add one returns two", {
  expect_equal(one(1), 2)
  expect_equal(one(3), 4)
  expect_equal(one(3), 5)
})
