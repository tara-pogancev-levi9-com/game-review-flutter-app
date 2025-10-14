enum HttpStatus {
  ok(200),
  created(201),
  noContent(204),
  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),
  internalServerError(500),
  serviceUnavailable(503);

  final int value;

  const HttpStatus(this.value);
}
