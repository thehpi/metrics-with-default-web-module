package nl.thehpi.rest;

import javax.ejb.Stateless;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("hello")
@Stateless
public class HelloResource {

  @Path("world")
  @GET
  @Produces(MediaType.TEXT_PLAIN)
  public Response helloWorld() {
    String output = "Hello World";
    return Response.status(200).entity(output + "\n").build();
  }
}
