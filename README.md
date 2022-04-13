# Laravel Template

### App Container
- Base: php:8.0-fpm-buster
  - Larevel: 6
    - [Support Policy](https://laravel.com/docs/8.x/releases#:~:text=in%20the%20future.-,Support%20Policy,-For%20LTS%20releases)
    - ※ Will be updated when laravel 9 (LTS) is released
    - ※ If you want to change the version of Laravel, use the following command
        <details>
        <summary>Details</summary>

        ```diff
        - composer create-project "laravel/laravel=6.*" ./
        + composer create-project "laravel/laravel=8.*" ./
        ```

        </details>
        

  - Composer:latest
### Web container
- Base: nginx:1.20-alpine

### DB container
- Base: mysql:8.0

### Redis Container
- Base: redis:latest


### About CI Actions

A git log will be sent to slack when the master branch is updated

If you want to specify the destination of Slack,Set Actions secrets.

1. Settings
2. Secrets
3. New Repository Seacret 
4. Add name: `SLACK_WEBHOOK` value: `your slack webhook url`