package itntsolutions;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.MediaType;

import itntsolutions.model.DTE;
import itntsolutions.model.Document;
import itntsolutions.model.Organization;
import itntsolutions.model.RequestDocument;
import javax.ws.rs.client.Entity;
import com.google.gson.*;

public class ClienteSII {

	Client cliente;
	Properties prop = new Properties();
	InputStream is = null;
	String apiKey = "";
	String endPoint = "";

	public ClienteSII() {
		try {
			this.cliente = ClientBuilder.newClient();
			is = new FileInputStream("C:/Users/froil/Desktop/siiOperationsConfig.properties");
			prop.load(is);
			apiKey = prop.getProperty("apiKey");
			endPoint = prop.getProperty("endPoint");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Organization infoContribuyente() {

		try {

			Client client = ClientBuilder.newClient();
			WebTarget webTarget = client.target(endPoint).path("organization");

			Invocation.Builder invocationBuilder = webTarget.request(MediaType.APPLICATION_JSON).header("apikey",
					apiKey);

			Response response = invocationBuilder.get();

			Gson gson = new Gson();

			Organization organization = gson.fromJson(response.readEntity(String.class), Organization.class);

			return organization;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public Document emitirDTE(String responseOutput[], DTE dteRequest) {

		try {

			Client client = ClientBuilder.newClient();

			Document document = new Document();

			RequestDocument requestDocument = new RequestDocument();

			requestDocument.setResponse(responseOutput);
			requestDocument.setDte(dteRequest);

			WebTarget webTarget = client.target(endPoint).path("document");

			Invocation.Builder invocationBuilder = webTarget.request(MediaType.APPLICATION_JSON).header("apikey",
					apiKey);

			Gson gson = new Gson();

			Response response = invocationBuilder
					.post(Entity.entity(gson.toJson(requestDocument), MediaType.APPLICATION_JSON));
			
			System.out.println(response.toString());

			document = gson.fromJson(response.readEntity(String.class), Document.class);

			return document;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
