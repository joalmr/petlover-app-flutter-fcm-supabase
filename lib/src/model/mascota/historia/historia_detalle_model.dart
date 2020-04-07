import 'dart:convert';

class Consultation { //tmb surgery
    dynamic anamnesis;
    dynamic findings;
    dynamic tests;
    dynamic testFiles;
    dynamic diagnoses;
    dynamic treatments;
    dynamic treatmentInstructions;
    String recommendations;
    String employeeId;
    double amount;

    Consultation({
        this.anamnesis,
        this.findings,
        this.tests,
        this.testFiles,
        this.diagnoses,
        this.treatments,
        this.treatmentInstructions,
        this.recommendations,
        this.employeeId,
        this.amount,
    });

    factory Consultation.fromJson(Map<String, dynamic> json) => Consultation(
        anamnesis: json["anamnesis"],
        findings: json["findings"],
        tests: json["tests"],
        testFiles: json["test_files"],
        diagnoses: json["diagnoses"],
        treatments: json["treatments"],
        treatmentInstructions: json["treatment_instructions"],
        recommendations: json["recommendations"],
        employeeId: json["employee_id"],
        amount: json["amount"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "anamnesis": anamnesis,
        "findings": findings,
        "tests": tests,
        "test_files": testFiles,
        "diagnoses": diagnoses,
        "treatments": treatments,
        "treatment_instructions": treatmentInstructions,
        "recommendations": recommendations,
        "employee_id": employeeId,
        "amount": amount,
    };
}

class Deworming {
    dynamic dewormers;
    dynamic dewormerDetails;
    String recommendations;
    String employeeId;
    double amount;

    Deworming({
        this.dewormers,
        this.dewormerDetails,
        this.recommendations,
        this.employeeId,
        this.amount,
    });

    factory Deworming.fromJson(Map<String, dynamic> json) => Deworming(
        dewormers: json["dewormers"],
        dewormerDetails: json["dewormer_details"],
        recommendations: json["recommendations"],
        employeeId: json["employee_id"],
        amount: json["amount"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "dewormers": dewormers,
        "dewormer_details": dewormerDetails,
        "recommendations": recommendations,
        "employee_id": employeeId,
        "amount": amount,
    };
}

class Grooming {
    dynamic groomings;
    String recommendations;
    String employeeId;
    double amount;

    Grooming({
        this.groomings,
        this.recommendations,
        this.employeeId,
        this.amount,
    });

    factory Grooming.fromJson(Map<String, dynamic> json) => Grooming(
        groomings: json["groomings"]==null ? "" : json["groomings"],
        recommendations: json["recommendations"]==null ? "" : json["recommendations"],
        employeeId: json["employee_id"]==null ? "" : json["employee_id"],
        amount: json["amount"].toDouble()==null ? 0 : json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "groomings": groomings,
        "recommendations": recommendations,
        "employee_id": employeeId,
        "amount": amount,
    };
}

class Vaccination {
    dynamic vaccines;
    dynamic vaccineDaysLeft;
    String recommendations;
    String employeeId;
    double amount;

    Vaccination({
        this.vaccines,
        this.vaccineDaysLeft,
        this.recommendations,
        this.employeeId,
        this.amount,
    });

    factory Vaccination.fromJson(Map<String, dynamic> json) => Vaccination(
        vaccines: json["vaccines"],
        vaccineDaysLeft: json["vaccine_days_left"],
        recommendations: json["recommendations"],
        employeeId: json["employee_id"],
        amount: json["amount"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "vaccines": vaccines,
        "vaccine_days_left": vaccineDaysLeft,
        "recommendations": recommendations,
        "employee_id": employeeId,
        "amount": amount,
    };
}