require "models/helper"

describe Picture do
  UUID_REGEX=/[a-zA-Z0-9]{8}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{12}/
  it "has a uuid for an id" do
    user = User.create(Fixtures::Users[:registered])
    picture = user.pictures.create(Fixtures.random(:picture))
    expect(picture.id).to match(UUID_REGEX)
  end
end
