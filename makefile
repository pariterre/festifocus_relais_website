
# List of available projects
PROJECTS := festifocus festifocus_admin

# Folders to keep during web server cleanup
FOLDER_TO_KEEP := .well-known cgi-bin resources

# Internal variables
BASE_FOLDER := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
WEB_BUILD_FOLDER := build/web

# Make targets
.PHONY: all list $(PROJECTS)

all: list

list:
	@echo "Available projects:"
	@for project in $(PROJECTS); do \
		echo "  - $$project"; \
	done

festifocus:
	@echo "Building FESTIFOCUS project..."; \
	cd $(BASE_FOLDER); \
	flutter clean; \
	flutter pub get; \
	flutter build web --release --dart-define=FESTIFOCUS_IS_ADMINISTRATION=false; \
	COMPILED_FOLDER=release/festifocus; \
	if [ -z "$${COMPILED_FOLDER}" ]; then \
		echo "ERROR -- COMPILED_FOLDER is not found. Please check the build process."; \
		exit 1; \
	fi; \
	rm -rf $${COMPILED_FOLDER}; \
	mkdir -p $${COMPILED_FOLDER}; \
	cp -r $(WEB_BUILD_FOLDER)/. $${COMPILED_FOLDER} \
	# Make sure the authentication are provided (FESTIFOCUS_SSH_USER, FESTIFOCUS_SSH_SERVER, FESTIFOCUS_SSH_FOLDER_MAIN) \
	if [ -z "$${FESTIFOCUS_SSH_USER}" ] || [ -z "$${FESTIFOCUS_SSH_SERVER}" ] || [ -z "$${FESTIFOCUS_SSH_FOLDER_MAIN}" ]; then \
		echo "ERROR -- FESTIFOCUS_SSH_USER, FESTIFOCUS_SSH_SERVER, or FESTIFOCUS_SSH_FOLDER_MAIN is not set. Please set them before building."; \
		exit 1; \
	fi; \
	ssh $${FESTIFOCUS_SSH_USER}@$${FESTIFOCUS_SSH_SERVER} "cd $${FESTIFOCUS_SSH_FOLDER_MAIN} && find . $(addprefix ! -name ,$(FOLDER_TO_KEEP)) -delete"; \
	rsync -azvP $(BASE_FOLDER)/$${COMPILED_FOLDER}/ $${FESTIFOCUS_SSH_USER}@$${FESTIFOCUS_SSH_SERVER}:$${FESTIFOCUS_SSH_FOLDER_MAIN}; \
	echo "Project built and sent successfully."

festifocus_admin:
	@echo "Building FESTIFOCUS project..."; \
	cd $(BASE_FOLDER); \
	flutter clean; \
	flutter pub get; \
	flutter build web --release --dart-define=FESTIFOCUS_IS_ADMINISTRATION=true; \
	COMPILED_FOLDER=release/festifocusadmin; \
	if [ -z "$${COMPILED_FOLDER}" ]; then \
		echo "ERROR -- COMPILED_FOLDER is not found. Please check the build process."; \
		exit 1; \
	fi; \
	rm -rf $${COMPILED_FOLDER}; \
	mkdir -p $${COMPILED_FOLDER}; \
	cp -r $(WEB_BUILD_FOLDER)/. $${COMPILED_FOLDER} \
	# Make sure the authentication are provided (FESTIFOCUS_SSH_USER, FESTIFOCUS_SSH_SERVER, FESTIFOCUS_SSH_FOLDER_ADMIN) \
	if [ -z "$${FESTIFOCUS_SSH_USER}" ] || [ -z "$${FESTIFOCUS_SSH_SERVER}" ] || [ -z "$${FESTIFOCUS_SSH_FOLDER_ADMIN}" ]; then \
		echo "ERROR -- FESTIFOCUS_SSH_USER, FESTIFOCUS_SSH_SERVER, or FESTIFOCUS_SSH_FOLDER_ADMIN is not set. Please set them before building."; \
		exit 1; \
	fi; \
	ssh $${FESTIFOCUS_SSH_USER}@$${FESTIFOCUS_SSH_SERVER} "cd $${FESTIFOCUS_SSH_FOLDER_ADMIN} && find . $(addprefix ! -name ,$(FOLDER_TO_KEEP)) -delete"; \
	rsync -azvP $(BASE_FOLDER)/$${COMPILED_FOLDER}/ $${FESTIFOCUS_SSH_USER}@$${FESTIFOCUS_SSH_SERVER}:$${FESTIFOCUS_SSH_FOLDER_ADMIN}; \
	echo "Project built and sent successfully."
	
