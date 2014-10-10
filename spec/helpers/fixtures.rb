module Fixtures

  def self.image_path(image)
    File.expand_path(File.join(__FILE__, "..", "..", "fixtures", "images", image))
  end

  Users = {
    guest: {
      email: "guest@example.com",
      nickname: "guest",
      password: "password"
    },
    registered: {
      email: "registered@example.com",
      nickname: "registered",
      password: "password"
    }
  }

  Pictures = {
    kitten:  {
      picture: File.open(image_path("adorable-kitten.jpg")),
      caption: "An adorable kitten",
      description: "Isn't it adorable? I think it is! YOU SHOULD TOO!"
    }
  }


  def self.random(type)
    if type == :picture
      collection = Pictures
    else
      collection = Users
    end

    collection[collection.keys.sample]
  end
end
