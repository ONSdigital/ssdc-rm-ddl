package uk.gov.ons.ssdc.common.model.entity;

import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import java.util.UUID;
import javax.persistence.*;
import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

@Entity
@DynamicUpdate
@Data
@TypeDefs({@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)})
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

  @Column private String originatingUser;

  @Type(type = "jsonb")
  @Column(columnDefinition = "jsonb")
  private Object uacMetadata;

  @Type(type = "jsonb")
  @Column(columnDefinition = "jsonb")
  private Object personalisation;
}
