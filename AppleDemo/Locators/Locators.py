#All the locators needed for executing the test case are in this Locators.py file

class Elements:

  def get_createid_link(self):
      link="Create Your Apple ID"
      return(link)

  def get_firstname_xpath(self):
      xpath="//first-name-input//input[@type='text']"
      return(xpath)

  def get_lastname_xpath(self):
      xpath="//last-name-input//input[@type='text']"
      return(xpath)

  def get_country_xpath(self):
      xpath = "//select[contains(@class,'form-dropdown country-picker')]"
      return (xpath)
  
  def get_dob_xpath(self):
      xpath="//input[contains(@class,'date date-input generic-input-field')]"
      return(xpath)
  
  def get_email_xpath(self):
      xpath="//input[contains(@class,'form-field email-field field-has-info')]"
      return(xpath)
  
  def get_password_id(self):
      id="password"
      return(id)
  
  def get_confirmpassword_xpath(self):
      xpath="//confirm-password-input//input[@type='password']"
      return(xpath)
  
  def get_countrycode_xpath(self):
      xpath = "//div[contains(@class,'form-group phone-input')]//select[contains(@class,'')]"
      return (xpath)

  def get_phonenumber_xpath(self):
      xpath = "//idms-textbox//input[@type='tel']"
      return (xpath)
  
  def get_captcha_xpath(self):
      xpath="//captcha-input//input[@type='text']"
      return(xpath)
  
  def get_continuebutton_classname(self):
      classname="overflow-text"
      return(classname)

  def get_ipadlink_xpath(self):
      xpath="//a[@class='ac-gn-link ac-gn-link-ipad']"
      return(xpath)

  def get_ipadminilink_xpath(self):
      xpath="//li[@class='chapternav-item chapternav-item-ipad-mini']//a[@class='chapternav-link']"
      return(xpath)

  def get_baglink_xpath(self):
      xpath="//li[@class='ac-gn-item ac-gn-bag']//a[@class='ac-gn-link ac-gn-link-bag']"
      return(xpath)

  def get_continuelink_xpath(self):
      xpath = "//a[@class='button button-block button-super']"
      return (xpath)

  def get_username_xpath(self):
      xpath = "//input[@name='appleId']"
      return (xpath)

  def get_password_xpath(self):
      xpath = "//input[@name='password']"
      return (xpath)

  def get_signIn_id(self):
      id="signInButtonId"
      return(id)

  def get_shopping_xpath(self):
      xpath="//a[@class='button button-block button-super button-secondary-alpha']"
      return(xpath)

  def get_searching_xpath(self):
      xpath="//a[@class='ac-gn-link ac-gn-link-search']"
      return(xpath)

  def get_item_xpath(self):
      xpath="//input[@id='ac-gn-searchform-input']"
      return(xpath)

  def get_accessories_id(self):
      id="accessories"
      return(id)

  def get_brand_xpath(self):
      xpath="//span[@class='as-search-accordion-title'][contains(text(),'Brand')]"
      return(xpath)

  def get_applecompany_xpath(self):
      xpath="//span[contains(@class,'as-search-filter-text')][text()='Apple']"
      return(xpath)

  def get_firstproduct_xpath(self):
      xpath="/html[1]/body[1]/div[2]/div[4]/div[3]/div[2]/div[2]/div[1]/div[1]/div[4]/div[2]/div[2]/div[2]/div[2]"
      return(xpath)

  def get_add_xpath(self):
      xpath="//span[contains(text(),'Add to Bag')]"
      return(xpath)

  def get_checkout_xpath(self):
      xpath="//button[@id='shoppingCart.actions.checkout']"
      return(xpath)

  def get_remove_xpath(self):
      xpath="//span[contains(text(),'Remove')]"
      return(xpath)

  def get_signbag_link(self):
      xpath="//li[@class='ac-gn-item ac-gn-bag']//a[contains(@class,'ac-gn-link ac-gn-link-bag')]"
      return(xpath)

  def get_signout_xpath(self):
      xpath="//a[@class='ac-gn-bagview-nav-link ac-gn-bagview-nav-link-signOut']"
      return(xpath)

  def get_signinlink_xpath(self):
      xpath="//a[@class='ac-gn-bagview-nav-link ac-gn-bagview-nav-link-signIn']"
      return(xpath)


e=Elements()
