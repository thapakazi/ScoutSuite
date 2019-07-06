build: configure
	docker build -t scoutsuite .

configure:
	@! [ -f .env ] && touch .env || ls .env
