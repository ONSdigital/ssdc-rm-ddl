package uk.gov.ons.ssdc.common.model.entity;

public enum UserGroupAuthorisedActivityType {
  SUPER_USER,
  LIST_SURVEYS(true),
  VIEW_SURVEY,
  CREATE_SURVEY(true),
  CREATE_EXPORT_FILE_TEMPLATE(true),
  CREATE_SMS_TEMPLATE(true),
  CREATE_EMAIL_TEMPLATE(true),
  LIST_COLLECTION_EXERCISES,
  VIEW_COLLECTION_EXERCISE,
  CREATE_COLLECTION_EXERCISE,
  ALLOW_EXPORT_FILE_TEMPLATE_ON_ACTION_RULE,
  LIST_ALLOWED_EXPORT_FILE_TEMPLATES_ON_ACTION_RULES,
  ALLOW_SMS_TEMPLATE_ON_ACTION_RULE,
  LIST_ALLOWED_SMS_TEMPLATES_ON_ACTION_RULES,
  ALLOW_EMAIL_TEMPLATE_ON_ACTION_RULE,
  LIST_ALLOWED_EMAIL_TEMPLATES_ON_ACTION_RULES,
  ALLOW_EXPORT_FILE_TEMPLATE_ON_FULFILMENT,
  LIST_ALLOWED_EXPORT_FILE_TEMPLATES_ON_FULFILMENTS,
  ALLOW_SMS_TEMPLATE_ON_FULFILMENT,
  LIST_ALLOWED_SMS_TEMPLATES_ON_FULFILMENTS,
  ALLOW_EMAIL_TEMPLATE_ON_FULFILMENT,
  LIST_ALLOWED_EMAIL_TEMPLATES_ON_FULFILMENTS,
  SEARCH_CASES,
  VIEW_CASE_DETAILS,
  LIST_ACTION_RULES,
  CREATE_EXPORT_FILE_ACTION_RULE,
  CREATE_FACE_TO_FACE_ACTION_RULE,
  CREATE_OUTBOUND_PHONE_ACTION_RULE,
  CREATE_DEACTIVATE_UAC_ACTION_RULE,
  CREATE_SMS_ACTION_RULE,
  CREATE_EMAIL_ACTION_RULE,
  CREATE_EQ_FLUSH_ACTION_RULE,
  LOAD_SAMPLE,
  VIEW_SAMPLE_LOAD_PROGRESS,
  LOAD_BULK_REFUSAL,
  VIEW_BULK_REFUSAL_PROGRESS,
  LOAD_BULK_UPDATE_SAMPLE_SENSITIVE,
  LOAD_BULK_INVALID,
  LOAD_BULK_UPDATE_SAMPLE,
  VIEW_BULK_UPDATE_SAMPLE_SENSITIVE_PROGRESS,
  VIEW_BULK_INVALID_PROGRESS,
  VIEW_BULK_UPDATE_SAMPLE_PROGRESS,
  DEACTIVATE_UAC,
  CREATE_CASE_REFUSAL,
  CREATE_CASE_INVALID_CASE,
  CREATE_CASE_EXPORT_FILE_FULFILMENT,
  CREATE_CASE_SMS_FULFILMENT,
  CREATE_CASE_EMAIL_FULFILMENT,
  UPDATE_SAMPLE,
  UPDATE_SAMPLE_SENSITIVE,
  LIST_EXPORT_FILE_TEMPLATES(true),
  LIST_EXPORT_FILE_DESTINATIONS(true),
  LIST_SMS_TEMPLATES(true),
  LIST_EMAIL_TEMPLATES(true),
  CONFIGURE_FULFILMENT_TRIGGER(true),
  EXCEPTION_MANAGER_VIEWER(true),
  EXCEPTION_MANAGER_PEEK(true),
  EXCEPTION_MANAGER_QUARANTINE(true),
  LIST_USERS;

  private boolean global;

  UserGroupAuthorisedActivityType() {
    this.global = false;
  }

  UserGroupAuthorisedActivityType(boolean global) {
    this.global = global;
  }

  public boolean isGlobal() {
    return global;
  }
}
