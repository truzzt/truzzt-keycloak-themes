Keycloak is an authentication provider that is currently used in our Truzzt-App project. In the following documentation, I will explain how you can adjust the frontend of the login, registration, logout, OTP, etc., screens. The code is written in the Freemarker language.

- Project URL: https://gitlab.orbiter.de/orbiter/idento

# Issue Report

If you think you have found a bug in the project, please feel free to create an issue here: (Please provide a clear and understandable description in the issue report.)

https://gitlab.orbiter.de/orbiter/idento/-/issues/new

# Docs

- Create Theme Tutorial: https://www.keycloak.org/docs/latest/server_development/#creating-a-theme

- Official Keycloak Themes: https://github.com/keycloak/keycloak/tree/main/themes

- Freemarker: [Provide relevant link or details]

# Instructions

1. Adjust the official Keycloak themes.

2. Package the official Keycloak themes in a JAR archive.

```jar cvf filename.jar *```

3. Replace the JAR file in the project and start it locally with Docker.

```docker build -t localkeycloak .```

```docker run -p 8080:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin localkeycloak```

4. Open the container and log in with the username admin and password admin.

5. Go to realm settings and select the theme that you want to test.

6. Log out and check the new adjustments that you have made.

Dockerfile 

FROM quay.io/keycloak/keycloak:20.0.2 as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
# ENV KC_FEATURES=token-exchange
# ENV KC_DB=postgres
# Install custom providers
COPY themes/ /opt/keycloak/providers/
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh","start-dev"]
