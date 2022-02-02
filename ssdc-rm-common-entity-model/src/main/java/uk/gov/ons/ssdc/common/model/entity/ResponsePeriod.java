package uk.gov.ons.ssdc.common.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

/*
 This is collection, or group of Scheduled Tasks to be performed over a period.
*/

@ToString(onlyExplicitlyIncluded = true)
@Data
@Entity
@TypeDefs({@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)})
@DynamicUpdate
public class ResponsePeriod {
  @Id private UUID id;

  private String name;

  @JsonIgnore @ManyToOne private Case caze;

  @OneToMany(mappedBy = "responsePeriod")
  List<ScheduledTask> scheduledTasks;

  // State here too,  yuk - but... otherwise needs to understand all ScheduledTasks etc
  private ResponsePeriodState
      responsePeriodState; // If closed, suspended here - then all ScheduledActions closed

  @Type(type = "jsonb")
  @Column(columnDefinition = "jsonb")
  private Map<String, String> metaData; // rude not too
}
