-------------------------------------------------------------------------------
-- Author       Thu Xuan Vu
-- Created      May 2022
-- Purpose      Map claims to encounter types at the claim line level.  Institutional claims use rev code or bill type, professional claims use place of service.
-- Notes        Revenue code 001 was removed to avoid miscalculation of paid amount.  If a claim is split in two and revenue center 001 is assigned to one of splits,
--              it will add excess dollars to the claim.
-------------------------------------------------------------------------------
-- Modification History
--
-- 06/15/2022  Thu Xuan Vu
--      Fixed spelling of treatment and psychiatric
-------------------------------------------------------------------------------

with encounter_crosswalk as(
  select
    case
  		when revenue_center_code in ('0450','0459') then 'emergency department'
      when left(bill_type_code,2) = '11' then 'acute inpatient'
      when left(bill_type_code,2) = '12' then 'acute inpatient'
      when left(bill_type_code,2) = '12' then 'skilled nursing facility'
      when left(bill_type_code,2) = '13' then 'outpatient'
      when left(bill_type_code,2) = '14' then 'other'
      when left(bill_type_code,2) = '15' then 'acute inpatient'
      when left(bill_type_code,2) = '16' then 'acute inpatient'
      when left(bill_type_code,2) = '17' then 'acute inpatient'
      when left(bill_type_code,2) = '18' then 'acute inpatient'
      when left(bill_type_code,2) = '22' then 'skilled nursing facility'
      when left(bill_type_code,2) = '23' then 'skilled nursing facility'
      when left(bill_type_code,2) = '24' then 'skilled nursing facility'
      when left(bill_type_code,2) = '25' then 'skilled nursing facility'
      when left(bill_type_code,2) = '26' then 'skilled nursing facility'
      when left(bill_type_code,2) = '27' then 'skilled nursing facility'
      when left(bill_type_code,2) = '28' then 'skilled nursing facility'
      when left(bill_type_code,2) = '31' then 'home health'
      when left(bill_type_code,2) = '32' then 'home health'
      when left(bill_type_code,2) = '33' then 'home health'
      when left(bill_type_code,2) = '34' then 'home health'
      when left(bill_type_code,2) = '35' then 'home health'
      when left(bill_type_code,2) = '36' then 'home health'
      when left(bill_type_code,2) = '37' then 'home health'
      when left(bill_type_code,2) = '38' then 'home health'
      when left(bill_type_code,2) = '41' then 'acute inpatient'
      when left(bill_type_code,2) = '42' then 'acute inpatient'
      when left(bill_type_code,2) = '43' then 'acute inpatient'
      when left(bill_type_code,2) = '44' then 'acute inpatient'
      when left(bill_type_code,2) = '45' then 'acute inpatient'
      when left(bill_type_code,2) = '46' then 'acute inpatient'
      when left(bill_type_code,2) = '47' then 'acute inpatient'
      when left(bill_type_code,2) = '48' then 'acute inpatient'
      when left(bill_type_code,2) = '51' then 'other'
      when left(bill_type_code,2) = '52' then 'other'
      when left(bill_type_code,2) = '53' then 'other'
      when left(bill_type_code,2) = '54' then 'other'
      when left(bill_type_code,2) = '55' then 'other'
      when left(bill_type_code,2) = '56' then 'other'
      when left(bill_type_code,2) = '57' then 'other'
      when left(bill_type_code,2) = '58' then 'other'
      when left(bill_type_code,2) = '61' then 'other'
      when left(bill_type_code,2) = '62' then 'other'
      when left(bill_type_code,2) = '63' then 'other'
      when left(bill_type_code,2) = '64' then 'other'
      when left(bill_type_code,2) = '65' then 'other'
      when left(bill_type_code,2) = '66' then 'other'
      when left(bill_type_code,2) = '67' then 'other'
      when left(bill_type_code,2) = '68' then 'other'
      when left(bill_type_code,2) = '71' then 'outpatient'
      when left(bill_type_code,2) = '72' then 'dialysis center'
      when left(bill_type_code,2) = '73' then 'federally qualified health center'
      when left(bill_type_code,2) = '74' then 'outpatient rehabilitation'
      when left(bill_type_code,2) = '75' then 'outpatient rehabilitation'
      when left(bill_type_code,2) = '76' then 'mental health center'
      when left(bill_type_code,2) = '79' then 'outpatient'
      when left(bill_type_code,2) = '81' then 'hospice'
      when left(bill_type_code,2) = '82' then 'hospice'
      when left(bill_type_code,2) = '83' then 'ambulatory surgical center'
      when left(bill_type_code,2) = '84' then 'inpatient'
      when left(bill_type_code,2) = '85' then 'outpatient'
      when left(bill_type_code,2) = '89' then 'other'
      when place_of_service_code = '21' then 'acute inpatient'
      when place_of_service_code = '24' then 'ambulatory surgical center'
      when place_of_service_code = '65' then 'dialysis center'
      when place_of_service_code = '23' then 'emergency department'
      when place_of_service_code = '10' then 'home health'
      when place_of_service_code = '12' then 'home health'
      when place_of_service_code = '34' then 'hospice'
      when place_of_service_code = '51' then 'inpatient psychiatric'
      when place_of_service_code = '52' then 'inpatient psychiatric'
      when place_of_service_code = '61' then 'inpatient rehabilitation'
      when place_of_service_code = '54' then 'other'
      when place_of_service_code = '53' then 'mental health center'
      when place_of_service_code = '11' then 'office visit'
      when place_of_service_code = '17' then 'office visit'
      when place_of_service_code = '49' then 'office visit'
      when place_of_service_code = '50' then 'office visit'
      when place_of_service_code = '71' then 'office visit'
      when place_of_service_code = '72' then 'office visit'
      when place_of_service_code = '03' then 'other'
      when place_of_service_code = '04' then 'other'
      when place_of_service_code = '05' then 'other'
      when place_of_service_code = '06' then 'other'
      when place_of_service_code = '07' then 'other'
      when place_of_service_code = '08' then 'other'
      when place_of_service_code = '09' then 'other'
      when place_of_service_code = '13' then 'other'
      when place_of_service_code = '14' then 'other'
      when place_of_service_code = '15' then 'other'
      when place_of_service_code = '16' then 'other'
      when place_of_service_code = '18' then 'other'
      when place_of_service_code = '26' then 'other'
      when place_of_service_code = '33' then 'other'
      when place_of_service_code = '41' then 'other'
      when place_of_service_code = '42' then 'other'
      when place_of_service_code = '60' then 'other'
      when place_of_service_code = '81' then 'other'
      when place_of_service_code = '99' then 'other'
      when place_of_service_code = '19' then 'outpatient'
      when place_of_service_code = '22' then 'outpatient'
      when place_of_service_code = '25' then 'outpatient'
      when place_of_service_code = '62' then 'outpatient rehabilitation'
      when place_of_service_code = '01' then 'other'
      when place_of_service_code = '31' then 'skilled nursing facility'
      when place_of_service_code = '32' then 'skilled nursing facility'
      when place_of_service_code = '55' then 'substance abuse treatment facility'
      when place_of_service_code = '56' then 'substance abuse treatment facility'
      when place_of_service_code = '57' then 'substance abuse treatment facility'
      when place_of_service_code = '58' then 'substance abuse treatment facility'
      when place_of_service_code = '02' then 'telehealth'
      when place_of_service_code = '20' then 'urgent care'
            else 'unmapped'
    end as encounter_type
    ,claim_type
    ,claim_id
    ,claim_line_number
    ,patient_id
    ,claim_start_date
    ,claim_end_date
    ,admit_source_code
    ,admit_type_code
    ,discharge_disposition_code
    ,physician_npi
    ,facility_npi
    ,ms_drg
    ,paid_amount
    ,charge_amount
    ,bill_type_code
    ,revenue_center_code
    ,place_of_service_code
from {{ source ('input_claims', 'TUVA_INPUT_CLAIMS')}}
where IFNULL(revenue_center_code,'') <> '0001'
) 
  
  select
    claim_type
  	,concat(claim_id,encounter_type) as merge_claim_id
    ,claim_id as original_claim_id
    ,claim_line_number
    ,patient_id
    ,encounter_type
    ,claim_start_date
    ,claim_end_date
    ,admit_source_code
    ,admit_type_code
    ,discharge_disposition_code
    ,physician_npi
    ,facility_npi
    ,ms_drg
    ,paid_amount
    ,charge_amount
    ,bill_type_code
    ,revenue_center_code
    ,place_of_service_code
  from encounter_crosswalk