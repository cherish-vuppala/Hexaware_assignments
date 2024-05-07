package com.hexaware;

import com.hexaware.dao.DatabaseManagerImpl;
import com.hexaware.date.utils.DateUtil;
import com.hexaware.entity.Applicant;
import com.hexaware.entity.Company;
import com.hexaware.entity.JobApplication;
import com.hexaware.entity.JobListing;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class JobPortalApp {
    public static void main(String[] args) throws IOException {
        // For reading input from console similar to Scanner class
        var br = new BufferedReader(new InputStreamReader(System.in));
        System.out.println("Select an option from the below menu");
        // DatabaseManagerImpl
        var dbAccessObject = new DatabaseManagerImpl();
        // Retrieval Choices
        System.out.println("1. Get list of Companies");
        System.out.println("2. Get list of JobListings");
        System.out.println("3. Get list of Applicants");
        System.out.println("4. Get list of JobApplications");
        //Insertion Choices
        System.out.println("5. Insert into Company");
        System.out.println("6. Insert into JobListing");
        System.out.println("7. Insert into Applicant");
        System.out.println("8. Insert into JobApplication");
        // reads a choice
        System.out.println("Enter your option: ");
        var choice = Integer.parseInt(br.readLine());
        switch (choice) {
            case 1 -> {
                System.out.println("List of Companies");
                var companies = dbAccessObject.getCompanies();
                for (var company : companies) {
                    System.out.println(company);
                }
            }
            case 2 -> {
                System.out.println("List of JobListings");
                var jobs = dbAccessObject.getJobListings();
                for (var job : jobs) {
                    System.out.println(job);
                }
            }
            case 3 -> {
                System.out.println("List of Applicants");
                var applicantList = dbAccessObject.getApplicants();
                for (var applicant: applicantList) {
                    System.out.println(applicant);
                }
            }
            case 4 -> {
                System.out.println("List of JobApplications");
                System.out.println("Enter the jobID: ");
                var jobID = Integer.parseInt(br.readLine());
                var jobApplications = dbAccessObject.getApplicationsForJob(jobID);
                for (var jobApplication : jobApplications) {
                    System.out.println(jobApplication);
                }
            }

            case 5 -> {
                System.out.println("To insert a new company please enter the following details");
                System.out.println("Enter company name: ");
                var companyName = br.readLine();
                System.out.println("Enter company location: ");
                var companyLocation = br.readLine();
                Company company = new Company(companyName, companyLocation);
               dbAccessObject.insertCompany(company);
            }

            case 6 -> {
                System.out.println("To insert a new job please enter the following " +
                        "details");
                System.out.println("Enter company id: ");
                var companyID =  Integer.parseInt(br.readLine());
                System.out.println("Enter job title: ");
                var jobTitle = br.readLine();
                System.out.println("Enter job location: ");
                var jobLocation = br.readLine();
                System.out.println("Enter job description: ");
                var jobDescription = br.readLine();
                System.out.println("Enter salary: ");
                var salary = Double.parseDouble(br.readLine());
                System.out.println("Enter job type ");
                var jobType = br.readLine();
                System.out.println("Enter application date: ");
                var date = br.readLine();
                var postedDate = DateUtil.stringToDate(date);
                var job = new JobListing(companyID,
                        jobTitle, jobDescription,
                        jobLocation, salary, jobType, postedDate
                        );
                System.out.println(job);
                dbAccessObject.insertJobListing(job);
            }

            case 7 -> {
                System.out.println("To insert a new Applicant please enter the following " +
                        "details");
                System.out.println("Enter first name of the candidate: ");
                var firstName = br.readLine();
                System.out.println("Enter last name of the candidate: ");
                var lastName = br.readLine();
                System.out.println("Enter email of the candidate: ");
                var email = br.readLine();
                System.out.println("Enter phone number of the candidate: ");
                var phoneNumber = br.readLine();
                System.out.println("Enter your skill set: ");
                var resume = br.readLine();
                var applicant = new Applicant(firstName,
                        lastName, email,
                        phoneNumber, resume);
                System.out.println(applicant);
                dbAccessObject.insertApplicant(applicant);
            }

            case 8 -> {
                System.out.println("To insert a job application please enter the following " +
                        "details");
                System.out.println("Enter job id: ");
                var jobID = Integer.parseInt(br.readLine());
                System.out.println("Enter applicant id: ");
                var applicantID = Integer.parseInt(br.readLine());
                System.out.println("Enter application date: ");
                var date = br.readLine();
                var applicationDate = DateUtil.stringToDate(date);
                System.out.println("Enter cover letter: ");
                var coverLetter = br.readLine();
                var job = new JobApplication(jobID, applicantID, applicationDate,
                        coverLetter);
                System.out.println(job);
                dbAccessObject.insertJobApplication(job);
            }

            default -> {
                System.out.println("Invalid choice, please enter a valid choice");
            }
        }
    }
}