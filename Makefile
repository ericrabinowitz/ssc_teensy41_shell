#
# ANSI Escape Codes for nice colorized console text output
#
TERM_RED='\033[0;31m'
TERM_GREEN='\033[0;32m'
TERM_LIGHT_GREEN='\033[1;32m'
TERM_ORANGE='\033[0;33m'
TERM_NC='\033[0m' # No Color, use this sequence to reset to plain text

.PHONY: clean build console con2

flash:
	@echo ${TERM_RED}"=== FLASHING"${TERM_ORANGE}:
	./teensy_loader_cli/teensy_loader_cli --mcu TEENSY41 build/zephyr/zephyr.hex -w -s -v

shell:

silver:

gold:
	west build  -b teensy41 console_first_working_shell --pristine

c2:
	west build  -b teensy41 ./console --pristine

console:
	west build  -b teensy41 zephyr/samples/subsys/usb/console --pristine

blink:
	west build  -b teensy41 zephyr/samples/basic/blinky --pristine

build:
	@echo ${TERM_LIGHT_GREEN}"=== BUILDING"${TERM_NC}:
	west build  -b teensy41 ssc_app --pristine
	@echo ${TERM_LIGHT_GREEN}"=== BUILDING COMPLETE"${TERM_NC}


