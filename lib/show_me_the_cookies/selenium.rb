class ShowMeTheCookies::Selenium
  def initialize(driver)
    @browser = driver.browser
    self
  end

  def get_me_the_cookie(cookie_name)
    @browser.manage.cookie_named(cookie_name)
  end

  def get_me_the_cookies
    @browser.manage.all_cookies
  end

  def expire_cookies
    cookies_to_delete = @browser.manage.all_cookies.each do |c|
      # we don't need to catch the expired cookies here, the browser will do it for us (duh!)
      @browser.manage.delete_cookie(c[:name]) if c[:expires] == nil
    end
  end

  def delete_cookie(cookie_name)
    @browser.manage.delete_cookie(cookie_name)
  end

  def set_cookie(cookie_name, value, opts = {})
    cookie_details => {
      :name => cookie_name,
      :value => value
    }.merge! opts
    @browser.manage.add_cookie(cookie_details)
  end

end