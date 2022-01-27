package computerdatabase

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._

class BasicSimulation extends Simulation 
{
  // get the number of users specified, falls back to 1 if not specified
  val numUsers = Integer.getInteger("users", 1)

  // get the URL specified
  val siteUrl = System.getProperty("siteUrl");

  val httpConf = http.baseUrl(siteUrl)
    .inferHtmlResources()
    .acceptHeader("text/html,application/json,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")
    .doNotTrackHeader("1")
    .acceptLanguageHeader("en-US,en;q=0.5")
    .acceptEncodingHeader("gzip, deflate")
    .userAgentHeader("Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:96.0) Gecko/20100101 Firefox/96.0")
    
  val scn = scenario("MyBasicSimulation")
    .exec(
      http("request_1")
      .get("/")
    )

  setUp(scn.inject(atOnceUsers(numUsers))).protocols(httpConf)
}