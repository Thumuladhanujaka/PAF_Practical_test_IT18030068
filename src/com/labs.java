package com;

import java.util.ArrayList;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import com.google.gson.*;
import org.json.simple.*;

import model.*;

import org.apache.tomcat.util.json.JSONParser;
import org.jsoup.*;
import org.jsoup.parser.*;
import org.jsoup.nodes.Document;

@Path("/app")
public class labs {

	labModel lab_model =new labModel();
	
	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String view(String app_text)
	{
		return lab_model.getTests();
	}
	
	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String add(String app_text)
	{
		
		//Convert the input string to a JSON object
		JsonObject app = new JsonParser().parse(app_text).getAsJsonObject();
		
		lab_model.addTests(app.get("name").getAsString(),Integer.parseInt(app.get("age").getAsString()),app.get("gender").getAsString(),app.get("date").getAsString(),app.get("test_name").getAsString());
		
		JSONObject json = new JSONObject();
		json.put("success", Integer.toString(lab_model.getSuccess()));
		
		return json.toString();
			
		
	}
	
	@PUT
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String edit(String app_text)
	{
		
		//Convert the input string to a JSON object
		JsonObject app = new JsonParser().parse(app_text).getAsJsonObject();
		
		lab_model.editTests(app.get("name").getAsString(),Integer.parseInt(app.get("age").getAsString()),app.get("gender").getAsString(),app.get("date").getAsString(),app.get("test_name").getAsString(),Integer.parseInt(app.get("id").getAsString()));
		
		JSONObject json = new JSONObject();
		json.put("success", Integer.toString(lab_model.getSuccess()));
		
		return json.toString();
			
	}
	
	@DELETE
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String delete(String app_text)
	{
		
		//Convert the input string to a JSON object
		JsonObject app = new JsonParser().parse(app_text).getAsJsonObject();
		
		lab_model.deleteTests(Integer.parseInt(app.get("id").getAsString()));
		
		JSONObject json = new JSONObject();
		json.put("success", Integer.toString(lab_model.getSuccess()));
		
		return json.toString();
			
		
	}
	
	@POST
	@Path("/get")
	@Produces(MediaType.TEXT_HTML)
	public String viewOne(String app_text)
	{
		JsonObject app = new JsonParser().parse(app_text).getAsJsonObject();
		
		return lab_model.getTests(Integer.parseInt(app.get("id").getAsString())).toString();
	}
	
}
