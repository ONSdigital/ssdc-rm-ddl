package uk.gov.ons.ssdc.common.model.entity;

import jakarta.persistence.*;
import java.util.Map;
import java.util.UUID;
import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

@Entity
@DynamicUpdate
@Data
public class FulfilmentToProcess {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @ManyToOne(optional = false)
  private ExportFileTemplate exportFileTemplate;

  @ManyToOne(optional = false)
  private Case caze;

  @Column private Integer batchQuantity;

  @Column private UUID batchId;

  @Column(nullable = false)
  private UUID correlationId;

  @Column(nullable = false, unique = true)
  private UUID messageId;

  @Column private String originatingUser;

  @JdbcTypeCode(SqlTypes.JSON)
  @Column(columnDefinition = "jsonb")
  private Object uacMetadata;

  @JdbcTypeCode(SqlTypes.JSON)
  @Column(columnDefinition = "jsonb")
  private Map<String, String> personalisation;
}
