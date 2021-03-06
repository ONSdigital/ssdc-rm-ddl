package uk.gov.ons.ssdc.common.model.entity;

import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import java.time.OffsetDateTime;
import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

@ToString(onlyExplicitlyIncluded = true) // Bidirectional relationship causes IDE stackoverflow
@Data
@Entity
@DynamicUpdate
@TypeDefs({@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)})
public class ActionRule {

  @Id private UUID id;

  @Enumerated(EnumType.STRING)
  @Column(nullable = false)
  private ActionRuleType type;

  @Column(nullable = false, columnDefinition = "timestamp with time zone")
  private OffsetDateTime triggerDateTime;

  @Column(nullable = false, columnDefinition = "BOOLEAN DEFAULT false")
  private boolean hasTriggered;

  @Lob
  @Type(type = "org.hibernate.type.BinaryType")
  @Column
  private byte[] classifiers;

  @ManyToOne private ExportFileTemplate exportFileTemplate;

  @ManyToOne private SmsTemplate smsTemplate;

  @ManyToOne private EmailTemplate emailTemplate;

  @Column(nullable = false)
  private String createdBy;

  @Column private String phoneNumberColumn;

  @Column private String emailColumn;

  @ManyToOne(optional = false)
  private CollectionExercise collectionExercise;

  @Type(type = "jsonb")
  @Column(columnDefinition = "jsonb")
  private Object uacMetadata;

  public void setClassifiers(String classifierClauseStr) {
    if (classifierClauseStr == null) {
      classifiers = null;
    } else {
      classifiers = classifierClauseStr.getBytes();
    }
  }

  public String getClassifiers() {
    if (classifiers == null) {
      return null;
    }

    return new String(classifiers);
  }
}
