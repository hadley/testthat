expect_report_unchanged <- function(name, reporter = find_reporter(name), file = "reporters/tests.R") {
  path <- test_path("reporters", paste0(name, ".txt"))

  local_reproducible_output(unicode = TRUE)

  expect_known_output(
    test_file(test_path(file), reporter, wrap = FALSE),
    path
  )
}

expect_report_to_file <- function(reporter, ...) {
  path <- tempfile()
  on.exit(unlink(path))
  reporter <- reporter$new(file = path, ...)

  test_file(test_path("reporters/tests.R"), reporter, wrap = FALSE)
  expect_true(file.exists(path))
}
