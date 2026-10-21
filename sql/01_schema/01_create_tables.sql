
CREATE TABLE hospital.patients (
    id UUID PRIMARY KEY,
    birthdate DATE,
    deathdate DATE,
    ssn VARCHAR(20),
    drivers VARCHAR(30),
    passport VARCHAR(30),
    prefix VARCHAR(20),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    suffix VARCHAR(20),
    maiden VARCHAR(100),
    marital VARCHAR(5),
    race VARCHAR(50),
    ethnicity VARCHAR(50),
    gender VARCHAR(10),
    birthplace TEXT,
    address TEXT,
    city VARCHAR(100),
    state VARCHAR(100),
    county VARCHAR(100),
    zip VARCHAR(15),
    lat NUMERIC(12,8),
    lon NUMERIC(12,8),
    healthcare_expenses NUMERIC(14,2),
    healthcare_coverage NUMERIC(14,2)
);

CREATE TABLE hospital.organizations (
    id UUID PRIMARY KEY,
    name TEXT,
    address TEXT,
    city VARCHAR(100),
    state VARCHAR(100),
    zip VARCHAR(15),
    lat NUMERIC(12,8),
    lon NUMERIC(12,8),
    phone VARCHAR(30),
    revenue NUMERIC(16,2),
    utilization INTEGER
);

CREATE TABLE hospital.providers (
    id UUID PRIMARY KEY,
    organization_id UUID REFERENCES hospital.organizations(id),
    name TEXT,
    gender VARCHAR(10),
    speciality VARCHAR(100),
    address TEXT,
    city VARCHAR(100),
    state VARCHAR(100),
    zip VARCHAR(15),
    lat NUMERIC(12,8),
    lon NUMERIC(12,8),
    utilization INTEGER
);

CREATE TABLE hospital.payers (
    id UUID PRIMARY KEY,
    name TEXT,
    address TEXT,
    city VARCHAR(100),
    state_headquartered VARCHAR(10),
    zip VARCHAR(15),
    phone VARCHAR(30),
    amount_covered NUMERIC(16,2),
    amount_uncovered NUMERIC(16,2),
    revenue NUMERIC(16,2),
    covered_encounters INTEGER,
    uncovered_encounters INTEGER,
    covered_medications INTEGER,
    uncovered_medications INTEGER,
    covered_procedures INTEGER,
    uncovered_procedures INTEGER,
    covered_immunizations INTEGER,
    uncovered_immunizations INTEGER,
    unique_customers INTEGER,
    qols_avg NUMERIC(12,8),
    member_months INTEGER
);

CREATE TABLE hospital.encounters (
    id UUID PRIMARY KEY,
    start_time TIMESTAMPTZ,
    stop_time TIMESTAMPTZ,
    patient_id UUID NOT NULL REFERENCES hospital.patients(id),
    organization_id UUID REFERENCES hospital.organizations(id),
    provider_id UUID REFERENCES hospital.providers(id),
    payer_id UUID REFERENCES hospital.payers(id),
    encounter_class VARCHAR(50),
    code VARCHAR(30),
    description TEXT,
    base_encounter_cost NUMERIC(14,2),
    total_claim_cost NUMERIC(14,2),
    payer_coverage NUMERIC(14,2),
    reason_code VARCHAR(30),
    reason_description TEXT,
    CHECK (stop_time IS NULL OR start_time IS NULL OR stop_time >= start_time)
);

CREATE TABLE hospital.conditions (
    start_date DATE,
    stop_date DATE,
    patient_id UUID NOT NULL REFERENCES hospital.patients(id),
    encounter_id UUID REFERENCES hospital.encounters(id),
    code VARCHAR(30),
    description TEXT
);

CREATE TABLE hospital.medications (
    start_time TIMESTAMPTZ,
    stop_time TIMESTAMPTZ,
    patient_id UUID NOT NULL REFERENCES hospital.patients(id),
    payer_id UUID REFERENCES hospital.payers(id),
    encounter_id UUID REFERENCES hospital.encounters(id),
    code VARCHAR(30),
    description TEXT,
    base_cost NUMERIC(14,2),
    payer_coverage NUMERIC(14,2),
    dispenses INTEGER,
    total_cost NUMERIC(14,2),
    reason_code VARCHAR(30),
    reason_description TEXT
);

CREATE TABLE hospital.observations (
    observation_time TIMESTAMPTZ,
    patient_id UUID NOT NULL REFERENCES hospital.patients(id),
    encounter_id UUID REFERENCES hospital.encounters(id),
    code VARCHAR(30),
    description TEXT,
    value TEXT,
    units VARCHAR(50),
    observation_type VARCHAR(50)
);

CREATE TABLE hospital.procedures (
    procedure_time TIMESTAMPTZ,
    patient_id UUID NOT NULL REFERENCES hospital.patients(id),
    encounter_id UUID REFERENCES hospital.encounters(id),
    code VARCHAR(30),
    description TEXT,
    base_cost NUMERIC(14,2),
    reason_code VARCHAR(30),
    reason_description TEXT
);


