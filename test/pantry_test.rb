require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/pantry'
require 'pry'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_stock_starts_empty
    assert_equal Hash.new, @pantry.stock
  end

  def test_it_can_check_stock
    assert_equal 0, @pantry.stock_check(@ingredient1)
  end

  def test_it_can_restock
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    assert_equal 15, @pantry.stock_check(@ingredient1)
    # @pantry.restock(@ingredient2, 7)
    # assert_equal 7, @pantry.stock_check(@ingredient2)
  end
end
