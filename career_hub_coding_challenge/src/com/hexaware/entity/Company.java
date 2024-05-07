package com.hexaware.entity;

import com.hexaware.date.utils.DateUtil;

import java.util.ArrayList;

import java.util.Date;
import java.util.List;

public class Company {
    // Attributes
    private int companyID;
    private String companyName;
    private String location;
    private List<JobListing> jobListings;

    // Constructor
    public Company(int companyID, String companyName, String location) {
        this.companyID = companyID;
        this.companyName = companyName;
        this.location = location;
        this.jobListings = new ArrayList<>();
    }

    public Company(String companyName, String location) {
        this.companyName = companyName;
        this.location = location;
    }

    public int getCompanyID() {
        return companyID;
    }

    public void setCompanyID(int companyID) {
        this.companyID = companyID;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public List<JobListing> getJobListings() {
        return jobListings;
    }

    public void setJobListings(List<JobListing> jobListings) {
        this.jobListings = jobListings;
    }

    public void postJob(String jobTitle, String jobLocation, double salary, String jobType) {
          jobListings.add(new JobListing(jobListings.size() + 1, companyID, jobTitle,
                                        null, jobLocation,
                                        salary, jobType, DateUtil.stringToDate(DateUtil.getCurrentDateAsString())
          ));
    }

    @Override
    public String toString() {
        return "[" + String.valueOf(companyID) + ", " + companyName+ ", " + location  + "]";
    }
}
