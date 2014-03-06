require 'spec_helper'

describe Post do
  it "should not be created without a title" do
    post = Post.new(body: "example body", title: "")
    post.should have(1).error_on(:title)
  end

  it "should not be created without a body" do
    post = Post.new(title: "example title", body: "")
    post.should have(1).error_on(:body)
  end

  it "should not be created without duplicated title" do
    first_post = Post.create(title: "Unique title", body: "Example body")
    post = Post.new(title: first_post.title, body: "Another body")
    post.should have(1).error_on(:title)
  end  
end
