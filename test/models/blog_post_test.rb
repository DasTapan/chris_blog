require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true when published_at is nil" do
    assert blog_posts(:drafted).draft?
  end

  test "draft? returns false where published_at is in past" do
    refute blog_posts(:published).draft?
  end

  test "draft? returns false where published_at is in future" do
    refute blog_posts(:scheduled).draft?
  end



  test "published? returns true where published_at is nil" do
    assert blog_posts(:published).published?
  end

  test "published? returns false where published_at is nil" do
    refute blog_posts(:drafted).published?
  end

  test "published? returns false where published_at is in future" do
    refute blog_posts(:scheduled).published?
  end



  test "scheduled? returns true where published_at is in future" do
    assert blog_posts(:scheduled).scheduled?
  end

  test "scheduled? returns false where published_at is in past" do
    refute blog_posts(:published).scheduled?
  end

  test "scheduled? returns false where published_at is in nil" do
    refute blog_posts(:drafted).scheduled?
  end
end
