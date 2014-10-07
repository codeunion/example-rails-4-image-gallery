module Fixtures
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

  def self.image_path(image)
    File.join(Rails.root, "spec", "fixtures", "images", image)
  end
end
