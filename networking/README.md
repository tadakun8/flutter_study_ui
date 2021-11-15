# networking

This directory contains several projects related to api communication when retrieving data from Flutter

## Several ways to display values retrieved from api

There are two ways to display the value retrieved from the api.

1. use `FutureBuilder`
    - use the classes that come standard with flutter.
    - https://github.com/tadakun8/flutter_study/tree/main/networking/future_provider
1. use `riverpod`
    - use the FutureProvider provided with riverpod.
    - https://github.com/tadakun8/flutter_study/tree/main/networking/api_with_http_package

## Memo

Basically, it seems to use the Flutter default http package for api communication.

However, the Flutter loadmap also mentions a package called `chopper`, which wraps the http package.
