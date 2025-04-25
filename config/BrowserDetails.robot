*** Settings ***
Resource    ./EnvDetails.robot


*** Variables ***
# Extecution Browser
# ${TEST_BROWSER}    headlesschrome
# ${TEST_BROWSER}    headlessfirefox
${DEV_BROWSER}      chrome
${PROD_BROWSER}     chrome  options=add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage")
${TEST_BROWSER}     ${${ENV}_BROWSER}
# ${TEST_BROWSER}    firefox
# ${TEST_BROWSER}    safari
