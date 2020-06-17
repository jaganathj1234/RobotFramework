*** Settings ***
Library    SeleniumLibrary
Library    ../ExternalKeywords/locators.py
Library    ../Resources/Resources.robot
Library    ../ExternalKeywords/UserKeywords.py

*** Variables ***
${Browser}    Chrome
${URL}    http://demowebshop.tricentis.com/

*** Keywords ***
Start Browser and Maximize
    open browser    ${URL}    ${Browser}
    maximize browser window

Element Locator Keyword
    [Arguments]    ${pathJson}
    ${loc}=   read_locator_from_json    ${pathJson}
    [Return]    ${loc}

Click Register Link
    ${elementloc}=    Element Locator Keyword  DemoWebMainPage.register_link
    click link    xpath:${elementloc}

Enter Gender
    select radio button    Gender    M

Enter FirstName and LastName
    [Arguments]    ${Fname}    ${Lname}
    ${elementloc}=    Element Locator Keyword  RegisterPage.first_name
    input text    name:${elementloc}    ${Fname}
    ${elementloc}=    Element Locator Keyword  RegisterPage.last_name
    input text    name:${elementloc}    ${Lname}

Enter Email
   [Arguments]    ${Email}
   ${elementloc}=    Element Locator Keyword  RegisterPage.email_id
   input text    name:${elementloc}    ${Email}

Enter Password
   [Arguments]    ${pass}    ${cpass}
   ${elementloc}=    Element Locator Keyword  RegisterPage.pass
   input text    name:${elementloc}    ${pass}
   ${elementloc}=    Element Locator Keyword  RegisterPage.confirm_pass
   input text    name:${elementloc}    ${cpass}

Click Register Button
   ${elementloc}=    Element Locator Keyword  RegisterPage.register_but
   click button    name:${elementloc}

Login To Website
   [Arguments]    ${Email}    ${Pass}
   ${elementloc}=    Element Locator Keyword  DemoWebMainPage.login_link
   click link    xpath:${elementloc}
   ${elementloc}=    Element Locator Keyword  LoginPage.email_id
   input text    name:${elementloc}    ${Email}
   ${elementloc}=    Element Locator Keyword  LoginPage.pass
   input text    name:${elementloc}    ${Pass}
   ${elementloc}=    Element Locator Keyword  LoginPage.login_but
   click button    xpath:${elementloc}


Shop for Items

   ${elementloc}=    Element Locator Keyword  DemoWebMainPage.books_link
   click link    xpath:${elementloc}
   ${elementloc}=    Element Locator Keyword  BooksSelectionPage.book_addToCart
   click button    xpath:${elementloc}
 #  ${elementloc}=    Element Locator Keyword  BooksSelectionPage.book_addToCart2
 #  click button    xpath:${elementloc}

View Shopping Cart
   ${elementloc}=    Element Locator Keyword  DemoWebMainPage.cart_link
   click element    xpath:${elementloc}
   ${elementloc}=    Element Locator Keyword  CheckOutPage.country_sel
   select from list by index    xpath:${elementloc}    2
   ${elementloc}=    Element Locator Keyword  CheckOutPage.TAC
   select checkbox    name:${elementloc}
   ${elementloc}=    Element Locator Keyword  CheckOutPage.checkout_but
   click button    name:${elementloc}

Billing Address
   [Arguments]    ${company}    ${city}    ${address1}    ${address2}    ${zip}    ${phone}    ${fax}
  # ${res}=    userkeywords.ddortext

    ${elementloc}=    Element Locator Keyword  BillingAddress.company
    input text    name:${elementloc}    ${company}
    ${elementloc}=    Element Locator Keyword  BillingAddress.country
    select from list by index    name:${elementloc}    2
    ${elementloc}=    Element Locator Keyword  BillingAddress.city
    input text    name:${elementloc}    ${city}
    ${elementloc}=    Element Locator Keyword  BillingAddress.address1
    input text    name:${elementloc}    ${address1}
    ${elementloc}=    Element Locator Keyword  BillingAddress.address2
    input text    name:${elementloc}    ${address2}
    ${elementloc}=    Element Locator Keyword  BillingAddress.zip
    input text    name:${elementloc}    ${zip}
    ${elementloc}=    Element Locator Keyword  BillingAddress.phone
    input text    name:${elementloc}    ${phone}
    ${elementloc}=    Element Locator Keyword  BillingAddress.fax
    input text    name:${elementloc}    ${fax}
    ${elementloc}=    Element Locator Keyword  BillingAddress.continue_but
    click button    xpath:${elementloc}

Shipping Address
    ${elementloc}=    Element Locator Keyword  ShippingAddress.continue_but
    click button    xpath:${elementloc}

Shipping Method
    ${elementloc}=    Element Locator Keyword  ShippingMethod.continue_but
    click button    xpath:${elementloc}

Payment Mode
     ${elementloc}=    Element Locator Keyword  Paymentmode.continue_but
     click button    xpath:${elementloc}

Payment Info
     ${elementloc}=    Element Locator Keyword  PaymentInfo.continue_but
     click button    xpath:${elementloc}

Confirm Order
     ${elementloc}=    Element Locator Keyword  ConfirmOrder.continue_but
     click button    xpath:${elementloc}