package uk.gov.ons.ssdc.common.model.entity;

import java.util.UUID;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import lombok.Data;

@Data
@Entity
public class ActionRuleSurveyExportFileTemplate {
  @Id private UUID id;

  @ManyToOne(optional = false)
  private Survey survey;

  @ManyToOne(optional = false)
  private ExportFileTemplate exportFileTemplate;
}