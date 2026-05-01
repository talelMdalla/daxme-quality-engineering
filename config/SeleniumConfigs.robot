*** Settings ***
Resource    ./EnvDetails.robot


*** Variables ***
# Number of retries
${SMALL_RETRY_COUNT}        2s
${MEDIUM_RETRY_COUNT}       3s
${LARGE_RETRY_COUNT}        5s

# Delay for a retry
${RETRY_DELAY}              1 s

# Default Timeout
${SELENIUM_TIMEOUT}         60
${LOCAL_SELENIUM_SPEED}     0.2
${DEV_SELENIUM_SPEED}       0.2
${PROD_SELENIUM_SPEED}      0.2
${TEST_SELENIUM_SPEED}      ${${ENV}_SELENIUM_SPEED}
