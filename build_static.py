# build_static.py

# Import necessary components from your app.py file
# - freezer: The Flask-Frozen instance
# - app: Your Flask application instance (to access config like FREEZER_DESTINATION)
# - logger: Your configured logger instance
from app import freezer, app, logger

if __name__ == '__main__':
    # This block executes when you run "python build_static.py" from your terminal.

    logger.info("Starting static site build process via build_static.py...")

    try:
        # The PAGES_DATA global variable in app.py is populated when app.py is imported.
        # Flask-Frozen's URL generators (like page_url_generator in app.py)
        # will ensure all dynamic page URLs are discovered.
        
        # Tell Flask-Frozen to "freeze" the site, i.e., generate all static files.
        freezer.freeze()

        # Log a success message, including the output directory.
        # The output directory is configured in app.py (app.config['FREEZER_DESTINATION']).
        output_directory = freezer.app.config.get('FREEZER_DESTINATION', 'build')
        logger.info(f"Static site build completed successfully! Files are in the '{output_directory}' directory.")

    except Exception as e:
        # Log any critical errors that occur during the build process.
        logger.critical(f"An error occurred during the static site build process: {e}", exc_info=True)
        
        # Exit with a non-zero status code to indicate failure, which can be useful for CI/CD pipelines.
        import sys
        sys.exit(1)
