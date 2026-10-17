# Jenkins Project0 — Pizza Shop

A Java web application that builds into a `.war` with Maven and deploys to Apache Tomcat. The app serves a pizza shop landing page with a live menu, an interactive cart, and a JSON menu API.

Continuous integration packages the WAR and deploys it to Tomcat; the same image can also be built and run with Docker.

## Project structure

```
Jenkins_Project0/
├── pom.xml                              # Maven POM — war packaging
├── Jenkinsfile                          # CI/CD pipeline
├── Dockerfile                           # Multi-stage build: Maven → Tomcat
├── docker-compose.yml
├── src/main/
│   ├── java/com/pizzashop/
│   │   └── PizzaServlet.java            # JSON menu API (/api/pizzas)
│   └── webapp/
│       ├── index.jsp                    # Pizza shop landing page
│       ├── style.css                    # Pizza theme styling
│       └── script.js                    # Cart and ordering logic
└── .github/
    └── workflows/
        └── ci.yml                       # Build on push / PR
```

## Requirements

- JDK 11+
- Maven 3.8+
- Apache Tomcat 9 (or Docker)

## Build

```bash
mvn clean package
```

Produces `target/pizza-shop.war`.

## Run with Docker

```bash
docker build -t jenkins-project0 .
docker run -d -p 8080:8080 --name pizza-shop jenkins-project0
```

Or with Compose:

```bash
docker compose up --build -d
```

Visit `http://localhost:8080`.

## Deploy to a running Tomcat

The app is served at the server root, so copy the WAR in as `ROOT.war`:

```bash
export CATALINA_HOME=/path/to/tomcat
"$CATALINA_HOME/bin/shutdown.sh" 2>/dev/null
rm -rf "$CATALINA_HOME/webapps/ROOT" "$CATALINA_HOME/webapps/ROOT.war"
cp target/pizza-shop.war "$CATALINA_HOME/webapps/ROOT.war"
"$CATALINA_HOME/bin/startup.sh"
```

Verify:

```bash
curl -s -o /dev/null -w "%{http_code}\n" http://localhost:8080/
curl -s http://localhost:8080/api/pizzas
```

## Jenkins pipeline

| Stage | Action |
|-------|--------|
| Checkout | Pull source from SCM |
| Build | `mvn clean compile` |
| Test | `mvn test` with JUnit results |
| Package WAR | `mvn war:war`, archive the artifact |
| Deploy to Tomcat | Upload the WAR via the Tomcat Manager |
| Verify | Assert HTTP 200 on the deployed app |

The deploy stage reads a Jenkins credential with the ID `tomcat-creds`. On the Tomcat side, a manager user with the `manager-script` role is required in `conf/tomcat-users.xml`.

## API

`GET /api/pizzas`

```json
{
  "menu": [
    {"name": "Cheese Margherita", "price": 12.99},
    {"name": "Pepperoni Classic", "price": 16.99},
    {"name": "Veggie Delight",     "price": 14.50}
  ],
  "shopName": "Pizza Shop",
  "deliveryTime": "30-45 mins"
}
```

## License

MIT — see [LICENSE](LICENSE).
