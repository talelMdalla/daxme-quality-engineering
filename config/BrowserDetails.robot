*** Settings ***
Resource    ./EnvDetails.robot


*** Variables ***
# Extecution Browser
${COMMON_OPTS}      add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage")
# ${COMMON_OPTS}    add_argument:--headless add_argument:--no-sandbox add_argument:--disable-dev-shm-usage
# ${TEST_BROWSER}    headlesschrome
# ${TEST_BROWSER}    headlessfirefox
${LOCAL_BROWSER}    chrome
${DEV_BROWSER}      'chrome    options=${COMMON_OPTS}'
${PROD_BROWSER}     'chrome    options=${COMMON_OPTS}'
${TEST_BROWSER}     ${${ENV}_BROWSER}
# ${TEST_BROWSER}    firefox
# ${TEST_BROWSER}    safari
