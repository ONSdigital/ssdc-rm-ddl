package uk.gov.ons.ssdc.common.model.entity;

import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;

@ToString(onlyExplicitlyIncluded = true) // Bidirectional relationship causes IDE stackoverflow
@Entity
@DynamicUpdate
@Data
public class UserGroupPermission {
  @Id private UUID id;

  @ManyToOne(optional = false)
  private UserGroup group;

  @ManyToOne private Survey survey;

  @Enumerated(EnumType.STRING)
  @Column
  private UserGroupAuthorisedActivityType authorisedActivity;
}
