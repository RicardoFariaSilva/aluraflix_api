alias AluraflixApi.Repo
alias AluraflixApi.Categories.Category
alias AluraflixApi.Videos.Video

Repo.insert!(%Category{
  title: "Free",
  color: "#FFF"
})

Repo.insert!(%Video{
  title: "Free 1",
  description: "First free video",
  url: "https://www.youtube.com/watch?v=9bZkp7q19f0"
})

Repo.insert!(%Video{
  title: "Free 2",
  description: "Second free video",
  url: "https://www.youtube.com/watch?v=OPf0YbXqDm0"
})

Repo.insert!(%Video{
  title: "Free 3",
  description: "Third free video",
  url: "https://www.youtube.com/watch?v=xpVfcZ0ZcFM"
})

Repo.insert!(%Video{
  title: "Free 4",
  description: "Fourth free video",
  url: "https://www.youtube.com/watch?v=SC4xMk98Pdc"
})

Repo.insert!(%Video{
  title: "Free 5",
  description: "Fifth free video",
  url: "https://www.youtube.com/watch?v=UYwF-jdcVjY"
})
