# hello-world-static

Static HTML website example.

## Source Files

Just hack into `./services/web/src`

## Development Server

You can run a Docker based development server.  

Issue `humble boot` from the project _CWD_ and your sources will be available at `http://localhost:8080`.

## Deploy

```
humble release [--dev|--prod]
```

## Run Deploy Image

```
humble boot [--dev|--prod]
```

### Prerequisites

- [Install Docker](https://www.docker.com/)
- [Install Humble CLI](https://github.com/marcopeg/humble-cli)

### Custom Port

Create a new file in the _CWD_ `.env.local`:

	HUMBLE_PORT=1234

restart the development server
