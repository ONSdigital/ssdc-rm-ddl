package uk.gov.ons.ssdc.common.model.entity;

import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import java.util.List;
import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;
import uk.gov.ons.ssdc.common.validation.ColumnValidator;

@ToString(onlyExplicitlyIncluded = true) // Bidirectional relationship causes IDE stackoverflow
@Data
@TypeDefs({@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)})
@Entity
public class Survey {
  @Id private UUID id;

  @Column(nullable = false)
  private String name;

  @Type(type = "jsonb")
  @Column(nullable = false, columnDefinition = "jsonb")
  private ColumnValidator[] sampleValidationRules;

  @Column(nullable = false)
  private String sampleDefinitionUrl;

  @Type(type = "jsonb")
  @Column(columnDefinition = "jsonb")
  private Object metadata;

  @Column(nullable = false)
  private boolean sampleWithHeaderRow;

  @Column(nullable = false)
  private char sampleSeparator;

  @OneToMany(mappedBy = "survey")
  private List<CollectionExercise> collectionExercises;

  @OneToMany(mappedBy = "survey")
  private List<ActionRuleSurveyExportFileTemplate> actionRuleExportFileTemplates;

  @OneToMany(mappedBy = "survey")
  private List<ActionRuleSurveySmsTemplate> actionRuleSmsTemplates;

  @OneToMany(mappedBy = "survey")
  private List<ActionRuleSurveySmsTemplate> actionRuleEmailTemplates;

  @OneToMany(mappedBy = "survey")
  private List<FulfilmentSurveyExportFileTemplate> fulfilmentExportFileTemplates;

  @OneToMany(mappedBy = "survey")
  private List<FulfilmentSurveySmsTemplate> smsTemplates;

  @OneToMany(mappedBy = "survey")
  private List<FulfilmentSurveyEmailTemplate> emailTemplates;
}
