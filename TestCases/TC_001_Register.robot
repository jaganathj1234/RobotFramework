*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Resources.robot
Library    ../ExternalKeywords/locators.py


*** Variables ***


*** Test Cases ***

TC_001 Browser Start
    Resources.Start Browser and Maximize

TC_002 Register
    Resources.Click Register Link
    Resources.Enter Gender
    Resources.Enter FirstName and LastName    jag1    jay1
    Resources.Enter Email    jag7@jag.com
    Resources.Enter Password    ps1234    ps1234
    Resources.Click Register Button

TC_003 Login
    Resources.Login To Website    jag7@jag.com    ps1234

TC_004 ShopItem
    Resources.Shop for Items
    sleep    2s

TC_005 CheckoutCart
    Resources.View Shopping Cart
    sleep    2s
TC_006 BillingAddress
    Resources.Billing Address    mindtree    Sydney    address1    address2    2066    1212121    989797

TC_007 CompleteOrder
    sleep    2s
    Resources.Shipping Address
    sleep    2s
    Resources.Shipping Method
    sleep    2s
    Resources.Payment Mode
    sleep    2s
    Resources.Payment Info
    sleep    2s
    Resources.Confirm Order

*** Keywords ***
