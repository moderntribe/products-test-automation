# This file will be consumed by both the CI and the tests.
# Some environment variables might not apply to one but might apply to the other: modify with care.

# What version of WordPress we want to install and test against.
# This has to be compatible with the `wp core download` command, see https://developer.wordpress.org/cli/commands/core/download/.
WP_VERSION=latest

# A space-separated list of plugin repositories that will be cloned in the WordPress installation folder and that are
# required for the plugin tests.
# E.g. "acme/plugin-one acme/plugin-two pirates/plugin-three".
# This value will be used in a bash array declaration to iterate and clone the plugins one by one; validate locally the
# format of this array using this bash command after exporting the var:
# declare -a plugins=(`echo ${REQUIRED_PLUGIN_REPOS}`); for p in "${plugins[@]}"; do echo "$p"; done
REQUIRED_PLUGIN_REPOS="moderntribe/%PLUGIN%"

# This is where, in the context of the CI, we'll install and configure WordPress.
# See `.travis.yml` for more information.
WP_ROOT_FOLDER=../../../wp

# The WordPress installation will be served from the Docker container.
# See `dev/docker/ci-compose.yml` for more information.
WP_URL=http://wp.test
WP_DOMAIN=wp.test

# The credentials that will be used to access the site in acceptance tests
# in methods like `$I->loginAsAdmin();`.
WP_ADMIN_USERNAME=admin
WP_ADMIN_PASSWORD=password

WP_DB_PORT=3307

# The databse is served from the Docker `db` container.
# See `dev/docker/ci-compose.yml` for more information.
WP_TABLE_PREFIX=wp_
WP_DB_HOST=127.0.0.1:3307
WP_DB_NAME=tribe_events_integration_test
WP_DB_USER=root
WP_DB_PASSWORD=mercs111

# The test databse is served from the Docker `db` container.
# See `dev/docker/ci-compose.yml` for more information.
WP_TEST_DB_HOST=127.0.0.1:3307
WP_TEST_DB_NAME=tribe_events_test
WP_TEST_DB_USER=root
WP_TEST_DB_PASSWORD=mercs111

# We're using Selenium and Chrome for acceptance testing.
# In CI context we're starting a Docker container to handle that.
# See the `dev/docker/ci-compose.yml` file.
CHROMEDRIVER_HOST=localhost
CHROMEDRIVER_PORT=4444

# The URL of the WordPress installation from the point of view of the Chromedriver container.
# Why not just use `wordpress`? While Chrome will accept an `http://wordpress` address WordPress
# will not, we call the WordPress container with a seemingly looking legit URL and leverage the
# lines that, in the `wp-config.php` file, will make it so that WordPress will use as its home
# URL whatever URL we reach it with.
# See the `dev/docker/wp-config.php` template for more information.
WP_CHROMEDRIVER_URL="wp.test"

# To run the tests let's force the background-processing lib to run in synchronous (single PHP thread) mode.
TRIBE_NO_ASYNC=1

