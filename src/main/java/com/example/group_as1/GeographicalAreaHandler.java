package com.example.group_as1;

import Util.DBUtil;
import bean.AreaDetails;
import bean.GeographicalArea;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GeographicalAreaHandler {
    private Connection dbConnection;

    public GeographicalAreaHandler() throws ClassNotFoundException{
        dbConnection = DBUtil.getConnection();
    }

    public List<Integer> getAllLevels (){
        try{
            String q = "SELECT * FROM geographicarea";

            PreparedStatement prepStatement = dbConnection.prepareStatement(q);

            // get results from query
            ResultSet results = prepStatement.executeQuery();
            List<Integer> levels = new ArrayList<>();
            if(results != null){
                //for each item found in the query, create new object, save it in list
                while(results.next()){
                    int level = results.getInt(3);
                    if(!levels.contains(level)){
                        levels.add(level);
                    }
                }
            }
            return levels;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<GeographicalArea> findByLevel (int level){
        try{
            String q = "SELECT * FROM geographicarea " +
                    "WHERE level = ?";

            PreparedStatement prepStatement = dbConnection.prepareStatement(q);
            prepStatement.setString(1, String.valueOf(level));

            // get results from query
            ResultSet results = prepStatement.executeQuery();
            List<GeographicalArea> areas = new ArrayList<>();
            if(results != null){
                //for each item found in the query, create new object, save it in list
                while(results.next()){
                    GeographicalArea newItem = new GeographicalArea();

                    //set attributes
                    newItem.setId(results.getInt(1));
                    newItem.setCode(results.getInt(2));
                    newItem.setLevel(results.getInt(3));
                    newItem.setName(results.getString(4));
                    newItem.setAlternativeCode(results.getInt(5));

                    areas.add(newItem);
                }
            }

            return areas;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<AreaDetails> RecordDetails(int id){
        try{
            String newRecord = "SELECT c.name,c.code,c.level,a.combined" +
                    "FROM geographicarea as c" +
                    "JOIN age as a" +
                    "ON c.geographicareaid=a.geographicArea" +
                    "WHERE c.geographicareaid = ?" +
                    "AND a.censusyear = 1" +
                    "AND a.agegroup = 1";
            PreparedStatement prepStatement = dbConnection.prepareStatement(newRecord);
            prepStatement.setString(1, String.valueOf(id));

            ResultSet results = prepStatement.executeQuery();
            List<AreaDetails> areaDetails = new ArrayList<>();

            while(results.next()){
                AreaDetails details = new AreaDetails();
                details.setName(results.getString(1));
                details.setCode(results.getInt(2));
                details.setLevel(results.getInt(3));
                details.setCombined(results.getInt(4));
                areaDetails.add(details);
            }
            return areaDetails;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
