require 'test_helper'

class ManhattansControllerTest < ActionController::TestCase
  setup do
    @manhattan = manhattans(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:manhattans)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create manhattan' do
    assert_difference('Manhattan.count') do
      post :create, manhattan: { city: @manhattan.city, establishment: @manhattan.establishment, name: @manhattan.name, notes: @manhattan.notes, num_cherries: @manhattan.num_cherries, recipe: @manhattan.recipe }
    end

    assert_redirected_to manhattan_path(assigns(:manhattan))
  end

  test 'should show manhattan' do
    get :show, id: @manhattan
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @manhattan
    assert_response :success
  end

  test 'should update manhattan' do
    patch :update, id: @manhattan, manhattan: { city: @manhattan.city, establishment: @manhattan.establishment, name: @manhattan.name, notes: @manhattan.notes, num_cherries: @manhattan.num_cherries, recipe: @manhattan.recipe }
    assert_redirected_to manhattan_path(assigns(:manhattan))
  end

  test 'should destroy manhattan' do
    assert_difference('Manhattan.count', -1) do
      delete :destroy, id: @manhattan
    end

    assert_redirected_to manhattans_path
  end
end
