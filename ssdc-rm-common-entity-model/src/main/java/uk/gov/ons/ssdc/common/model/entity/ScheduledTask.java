package uk.gov.ons.ssdc.common.model.entity;

import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import java.time.OffsetDateTime;
import java.util.Map;
import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

@ToString(onlyExplicitlyIncluded = true)
@Data
@Entity
@TypeDefs({@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)})
@DynamicUpdate
@Table(
    name = "scheduledTasks",
    indexes = {@Index(name = "scheduled_task_date", columnList = "rmToActionDate")})
public class ScheduledTask {
  @Id private UUID id;

  @ManyToOne private ResponsePeriod responsePeriod;

  private String taskName; // Be automatically named, maybe?
  private OffsetDateTime rmToActionDate; // Indexed on this

  private String
      classifer; // Should this fire, for example for incentive:  Is there a completed PCR & EQ
                 // within the same responsePeriod
  // This could be used for unforeseen other scheduledTask data issues.
  // or for MVP just have a sort of hard code SET_COMPLETED (PCR, EQ).
  // This could be SPEL now, or become moer advanced in the future with SPEL, SQL or a nother
  // For CIS we have quite simple requirements SET_COMPLETED TRUE/FALSE

  private ScheduledTaskType taskType; // eg.  SEND_BY_PACKCODE(CIS_PCR)

  @OneToOne
  private UacQidLink
      uacQidLink; // If QID created on SEND, link to it.  Will make 'completing' this task easier.

  @OneToOne private Event sentEvent; // Link to event confirming sending

  @OneToOne private Event receiptingEvent; // Link to event confirming receipt, if required

  private boolean
      receiptRequiredForCompletion; // is a receipt required to move to completed, for reminders,
                                    // no.
  private ScheduledTaskState
      actionState; // An enum of NOT_STARTED/SENT/COMPLETED/SUSPSENDED/NOT_COMPLETED.

  @Type(type = "jsonb")
  @Column(columnDefinition = "jsonb")
  private Map<String, String> metaData; // rude not too
}
