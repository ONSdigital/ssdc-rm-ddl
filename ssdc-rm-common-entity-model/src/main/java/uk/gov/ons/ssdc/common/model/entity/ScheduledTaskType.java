package uk.gov.ons.ssdc.common.model.entity;

public enum ScheduledTaskType {
  ACTION_WITH_PACKCODE, // Covers sending out printfile, SMS, Email for PCR, Blood, Reminder and
                        // Incentive?
  RECORD_FAILURE // in CIS cases we want to mark 1 of the 3 strikes
}
