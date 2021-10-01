package uk.gov.ons.ssdc.common.model.entity;

import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import javax.persistence.*;
import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;
import org.hibernate.annotations.UpdateTimestamp;

@ToString(onlyExplicitlyIncluded = true) // Bidirectional relationship causes IDE stackoverflow
@Data
@TypeDefs({@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)})
@Entity
public class UacQidLink {
  @Id private UUID id;

  @Column(nullable = false, name = "qid") // "name" annotation required for index on column to work
  private String qid;

  @Column(nullable = false)
  private String uac;

  @ManyToOne(optional = false)
  private Case caze;

  @OneToMany(mappedBy = "uacQidLink")
  private List<Event> events;

  @Column(nullable = false, columnDefinition = "BOOLEAN DEFAULT true")
  private boolean active = true;

  @Column(columnDefinition = "timestamp with time zone")
  @CreationTimestamp
  private OffsetDateTime createdAt;

  @Column(columnDefinition = "timestamp with time zone")
  @UpdateTimestamp
  private OffsetDateTime lastUpdatedAt;

  @Type(type = "jsonb")
  @Column(columnDefinition = "jsonb")
  private Object uacMetadata;
}
