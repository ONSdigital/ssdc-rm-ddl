package uk.gov.ons.ssdc.common.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import java.time.OffsetDateTime;
import java.util.UUID;
import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

@Data
@Entity
@DynamicUpdate
public class ActionTemplateRow {

  @Id private UUID id;

  @ManyToOne(optional = false)
  private ActionTemplate actionTemplate;

  @Enumerated(EnumType.STRING)
  @Column(nullable = false)
  private ActionRuleType actionType;

  @ManyToOne(optional = true)
  private EmailTemplate emailTemplate;

  @Column private Integer cohort;

  @Column private Integer offset;

  @Column private OffsetDateTime triggerTime;
}
