require 'generators/generators_test_helper'
require 'rails/generators/rails/assets/assets_generator'

# FOXME: Silence the 'Could not find task "using_coffee?"' message in tests due to the public stub
class AssetsGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  arguments %w(posts)

  def test_assets
    run_generator
    assert_file "app/assets/javascripts/posts.js.coffee"
    assert_file "app/assets/stylesheets/posts.css.scss"
  end

  def test_skipping_assets
    content = run_generator ["posts", "--no-stylesheets", "--no-javascripts"]
    assert_no_file "app/assets/javascripts/posts.js.coffee"
    assert_no_file "app/assets/stylesheets/posts.css.scss"
  end

  def test_vanilla_assets
    run_generator ["posts", "--no-javascript-engine", "--no-stylesheet-engine"]
    assert_file "app/assets/javascripts/posts.js"
    assert_file "app/assets/stylesheets/posts.css"
  end
end
