alias AluraflixApi.Repo
alias AluraflixApi.Categories.Category
alias AluraflixApi.Videos

Repo.insert!(%Category{
  title: "Free",
  color: "#FFF"
})

Videos.create_video(%{
  title: "Free 1",
  description: "First free video",
  url: "https://www.youtube.com/watch?v=9bZkp7q19f0"
})

Videos.create_video(%{
  title: "Free 2",
  description: "Second free video",
  url: "https://www.youtube.com/watch?v=OPf0YbXqDm0"
})

Videos.create_video(%{
  title: "Free 3",
  description: "Third free video",
  url: "https://www.youtube.com/watch?v=xpVfcZ0ZcFM"
})

Videos.create_video(%{
  title: "Free 4",
  description: "Fourth free video",
  url: "https://www.youtube.com/watch?v=SC4xMk98Pdc"
})

Videos.create_video(%{
  title: "Free 5",
  description: "Fifth free video",
  url: "https://www.youtube.com/watch?v=UYwF-jdcVjY"
})
