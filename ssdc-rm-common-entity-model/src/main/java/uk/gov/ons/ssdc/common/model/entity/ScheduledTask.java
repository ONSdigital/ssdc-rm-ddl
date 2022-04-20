package uk.gov.ons.ssdc.common.model.entity;

import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import java.time.OffsetDateTime;
import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.Table;
import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

@ToString(onlyExplicitlyIncluded = true) // Bidirectional relationship causes IDE stackoverflow
@Data
@TypeDefs({@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)})
@Entity
@Table(
    name = "scheduledTasks",
    indexes = {@Index(name = "scheduled_task_date", columnList = "rmToActionDate")})
public class ScheduledTask {
  @Id private UUID id;

  @Column(nullable = false)
  private UUID caseId;

  @Column(nullable = false)
  private String name;

  @Column(nullable = false)
  private OffsetDateTime rmToActionDate; // Indexed on this

  /*
   Having columns for ScheduledTaskType & packCode are holders for now.
   Will migrate/evolve to something like SPEL:
   SEND_WITH_CODE(CIS_PCR).
    or
   more complex IF/ELSE etc
  */
  @Column private ScheduledTaskType scheduledTaskType;
  @Column private String packCode;
}
