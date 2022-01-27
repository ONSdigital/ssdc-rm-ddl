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

  // This will have an ScheduledTaskType field
  // After that it may be a bit looser
  // For letter out it might just look like: {ScheduledTaskType: ACTION_WITH_PACKCODE, packCode:
  // CIS_PCR}
  // For more 'complex' ones like 'Failure to complete'
  // { ScheduledTaskType: RUN_SOME_SPEL, SPEL: If condition A Do B  }
  // For INCENTIVE
  // { ScheduledTaskType: RUN_SOME_SPEL, SPEL: If condition A Do B  }
  // SPEL is not an MVP requirement, but seems most flexible?
  private Map<String, String> scheduledTaskDetails;
  // ^ of course we could 'just' have some sort of SPEL, magic thing here with nothing else?
  // But   ACTION_WITH_PACKCODE  seems really, really, really, common

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
