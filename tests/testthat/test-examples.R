test_that("test_examples works with installed packages", {
  with_mock(
    test_rd = identity,
    {
      res <- test_examples()
    }
  )
  expect_true(length(res) > 1)
})

test_that("test_examples fails if no examples", {
  withr::local_envvar(list(TESTTHAT_PKG = ""))
  expect_error(test_examples("asdf"), "Could not find examples")
})
