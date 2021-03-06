require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = providers(:aadil)
  end

  test 'unsuccessful edit' do
    log_in_as(@user)
    get edit_provider_path(@user)
    assert_template 'providers/edit'
    patch provider_path(@user), provider: { name: '', email: 'foo@invalid',
                                            password: 'foo', password_confirmation: 'bar' }
    assert_template 'providers/edit'
  end

  test 'successful edit with friendly forwarding' do
    get edit_provider_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_provider_path(@user)
    name = 'Foo Bar'
    email = 'foo@bar.com'
    patch provider_path(@user), provider: { name: name, email: email,
                                                      password: '', password_confirmation: '' }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
