package uk.gov.ons.ssdc.common.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import java.util.UUID;
import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

@Data
@Entity
@DynamicUpdate
public class EmailTemplate {
  @Id private String packCode;

  @JdbcTypeCode(SqlTypes.JSON)
  @Column(columnDefinition = "jsonb", nullable = false)
  private String[] template;

  @Column(nullable = false)
  private UUID notifyTemplateId;

  @Column(nullable = false)
  private String description;

  @Column(nullable = false)
  private String notifyServiceRef;

  @JdbcTypeCode(SqlTypes.JSON)
  @Column(columnDefinition = "jsonb")
  private Object metadata;
}
