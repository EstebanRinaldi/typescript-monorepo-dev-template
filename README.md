# NodeJS Developer Environment Template

Template for NodeJS development with VSCode inside a Docker Container.

## Requirements

- [Docker Engine](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)

- [Visual Studio Code](https://code.visualstudio.com/)
- [VS Code Remote Development Extension](https://aka.ms/vscode-remote/download/extension)
- [VS Code Docker Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) *(optional)*

## Usage

1. Click **Use this template**
2. Select **Create a new repository**
3. Update the .env file.
4. Run the **Remote-Containers: Reopen in Container...** command from the Command Palette (F1) or quick actions Status bar item.
5. Optionally update the package.json to match your project.
6. Start working.

To return to the local project:
- Run the **Remote-Containers: Reopen Locally...** command from the Command Palette (F1) or quick actions Status bar item.

## Development Container

The container includes NodeJS (chekh .env to change version), with nodemon and Yarn installed globally.

## Docker Services Included

- MSSQL
- Postgres (with pgAdmin)
- MySQL (with phpMyAdmin)
- MariaDB (with phpMyAdmin)

## External Links

- [Developing inside a Container](https://code.visualstudio.com/docs/remote/containers)
- [Development Containers: An open specification for enriching containers with development specific content and settings.](https://containers.dev/)
- [devcontainers: Official organization for the Development Containers Specification and dev container resources.](https://github.com/devcontainers)
