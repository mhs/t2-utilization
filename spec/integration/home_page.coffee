test 'Page Title', ->
  expect 1
  visit("/").then ->
    ok exists("ul")
