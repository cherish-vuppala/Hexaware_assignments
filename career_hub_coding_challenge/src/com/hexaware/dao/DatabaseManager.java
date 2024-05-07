package com.hexaware.dao;


import com.hexaware.entity.*;
import java.util.List;

public interface DatabaseManager {
    void insertJobListing(JobListing job);
    void insertCompany(Company company);
    void insertApplicant(Applicant applicant);
    void insertJobApplication(JobApplication application);
    List<JobListing> getJobListings();
    List<Company> getCompanies();
    List<Applicant> getApplicants();
    List<JobApplication> getApplicationsForJob(int jobID);
}

