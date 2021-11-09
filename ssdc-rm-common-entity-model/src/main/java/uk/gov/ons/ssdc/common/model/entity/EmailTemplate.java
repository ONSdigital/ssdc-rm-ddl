package uk.gov.ons.ssdc.common.model.entity;

import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import lombok.Data;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

@Data
@TypeDefs({@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)})
@Entity
public class EmailTemplate {
  @Id private String packCode;

  @Type(type = "jsonb")
  @Column(columnDefinition = "jsonb", nullable = false)
  private String[] template;

  @Column(nullable = false)
  private UUID notifyTemplateId;

  @Column(nullable = false)
  private String description;

  @Type(type = "jsonb")
  @Column(columnDefinition = "jsonb")
  private Object metadata;
}
