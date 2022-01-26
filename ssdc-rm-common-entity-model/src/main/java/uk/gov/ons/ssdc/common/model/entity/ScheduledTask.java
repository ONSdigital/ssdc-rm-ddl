package uk.gov.ons.ssdc.common.model.entity;

import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import java.time.OffsetDateTime;
import java.util.UUID;

@ToString(onlyExplicitlyIncluded = true)
@Data
@TypeDefs({@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)})
@Entity
@DynamicUpdate
public class ScheduledTask {
  @Id private UUID id;

  @ManyToOne
  private ResponsePeriod responsePeriod;

  private String taskName;  //Be automatically named, maybe?
  private OffsetDateTime rmToActionDate;  // Indexed on this

  private String sqlClassifier; // Should this fire, for example for incentive:  Is there a completed PCR & EQ within the same response mech
                                // This could be used for unforeseen other scheduledTask data issues.



  private String packCode;  // Should these really move on a database table anyway. Would be a foreign key here, not for this spike

  @OneToOne
  private Event sentEvent; // Link to event confirming sending

  @OneToOne
  private Event receiptingEvent; // Link to event confirming receipt, if required

  private boolean receiptRequiredForCompletion; // is a receipt required to move to completed, for reminders, no.
  private ScheduledTaskState actionState; //An enum of NOT_STARTED/SENT/COMPLETED/SUSPSENDED/NOT_COMPLETED.
}
