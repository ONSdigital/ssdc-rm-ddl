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
import javax.persistence.OneToMany;
import java.util.List;
import java.util.UUID;


/*
  This is collection, or group of Scheduled Tasks to be performed over a period.
 */

@ToString(onlyExplicitlyIncluded = true)
@Data
@TypeDefs({@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)})
@Entity
@DynamicUpdate
public class ResponsePeriod {
  @Id private UUID id;

  private String name;

  @ManyToOne
  private Case caze;

  @OneToMany(mappedBy = "responsePeriod")
  List<ScheduledTask> responsePeriods;

  private ResponsePeriodState responsePeriodState;   // If closed, suspended here - then all ScheduledActions closed
}
