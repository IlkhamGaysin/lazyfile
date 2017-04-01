# Synopsis
#
# Assume Ruby 1.9.3-p194 or later
#
# We need a helper method that we can include in any class.
# The helper should accept a block and assign objects of lazy-temp files to each
# argument of this block, no matter how many arguments there are.
#
# For example:
#
# with_lazyfiles do |file1, file2, file3|
#   file2.write "hello"
# end
#
# All temp files should be deleted after block finished.
#
# What are lazy-temp files?
# Temp files should not be created until they used inside block. In current
# example, file1 and file3 will never physically created, since they not used.
# Otherwise lazy-temp files should work similar to Tempfile from ruby stdlib.
# Also, all names of temp files (in file system) should start with "mediapeers".
#
# When you run this script, the tests are played automatically. Of course, you
# can not change tests. They all should be satisfied with your code

# [Your code should be here]

require_relative 'test_helper'

class LazyfileTest < Test::Unit::TestCase
  def setup
    @object = Object.new
    @object.extend(Lazyfile::Helper)
  end

  def teardown
    Dir["#{Dir.tmpdir}/mediapeers*"].each do |path|
      File.unlink(path)
    end
  end

  def test_object_receives_helper_method
    assert_respond_to @object, :with_lazyfiles
  end

  def test_helper_runs_block
    foo = false
    @object.with_lazyfiles { foo = true }
    assert foo, 'Expected with_lazyfiles block to be executed'
  end

  # def test_helper_creates_2_tempfiles_when_passed_2_arguments
  #   @object.with_lazyfiles do |a, b|
  #     [a, b].each do |arg|
  #       assert arg.is_a?(Lazyfile),
  #         'Expected argument to be a Lazyfile object'
  #     end
  #   end
  # end

  # def test_helper_creates_5_tempfiles_when_passed_5_arguments
  #   @object.with_lazyfiles do |a, b, c, d, e|
  #     [a, b, c, d, e].each do |arg|
  #       assert arg.is_a?(Lazyfile),
  #         'Expected argument to be a Lazyfile object'
  #     end
  #   end
  # end

  # def test_helper_creates_only_referenced_tempfile
  #   @object.with_lazyfiles do |file1, file2|
  #     assert_empty Dir["#{Dir.tmpdir}/mediapeers*"]
  #     assert_match /^mediapeers/, File.basename(file1.path)
  #     assert Dir["#{Dir.tmpdir}/mediapeers*"].one?,
  #       'Expected only one temp file to exist'
  #   end
  # end

  # def test_helper_cleans_up_after_itself
  #   @object.with_lazyfiles do |file1, file2, file3|
  #     file1.path
  #     file2.path
  #     assert_equal 2, Dir["#{Dir.tmpdir}/mediapeers*"].size
  #   end

  #   assert_empty Dir["#{Dir.tmpdir}/mediapeers*"]
  # end

  # def test_files_respond_to_common_tempfile_methods
  #   @object.with_lazyfiles do |file|
  #     [:path, :size, :close, :open, :unlink].each do |method_name|
  #       assert_respond_to file, method_name
  #     end
  #   end
  # end

  # def test_respond_to_does_not_create_tempfile
  #   @object.with_lazyfiles do |file|
  #     file.respond_to?(:path)
  #     assert_empty Dir["#{Dir.tmpdir}/mediapeers*"]
  #   end
  # end
end
