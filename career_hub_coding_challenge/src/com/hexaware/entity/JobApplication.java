package com.hexaware.entity;

import java.util.Date;

public class JobApplication {
    // Attributes
    private int applicationID;
    private int jobID;
    private int applicantID;
    private Date applicationDate;
    private String coverLetter;

    // Constructor
    public JobApplication(int applicationID, int jobID, int applicantID, Date applicationDate, String coverLetter) {
        this.applicationID = applicationID;
        this.jobID = jobID;
        this.applicantID = applicantID;
        this.applicationDate = applicationDate;
        this.coverLetter = coverLetter;
    }

    public JobApplication(int jobID, int applicantID, Date applicationDate, String coverLetter) {
        this.jobID = jobID;
        this.applicantID = applicantID;
        this.applicationDate = applicationDate;
        this.coverLetter = coverLetter;
    }

    // Getters
    public int getApplicationID() {
        return applicationID;
    }

    public int getJobID() {
        return jobID;
    }

    public int getApplicantID() {
        return applicantID;
    }

    public Date getApplicationDate() {
        return applicationDate;
    }

    public String getCoverLetter() {
        return coverLetter;
    }

    @Override
    public String toString() {
       return "[" + applicantID + ", " + jobID + ", " + applicantID + ", " + applicationDate + "," +
               coverLetter + "]";
    }
}
