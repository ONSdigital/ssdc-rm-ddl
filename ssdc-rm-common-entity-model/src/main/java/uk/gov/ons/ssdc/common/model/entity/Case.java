package uk.gov.ons.ssdc.common.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.*;
import org.hibernate.type.SqlTypes;

@ToString(onlyExplicitlyIncluded = true) // Bidirectional relationship causes IDE stackoverflow
@Data
@Entity
@DynamicUpdate
@Table(
    name = "cases",
    indexes = {@Index(name = "cases_case_ref_idx", columnList = "case_ref")})
public class Case {

  @Id private UUID id;

  // This incrementing column allows us to generate a pseudorandom unique (non-colliding) caseRef
  @Column(columnDefinition = "serial")
  @Generated(GenerationTime.INSERT)
  private int secretSequenceNumber;

  @Column(name = "case_ref")
  private Long caseRef;

  @Column(columnDefinition = "timestamp with time zone")
  @CreationTimestamp
  private OffsetDateTime createdAt;

  @Column(columnDefinition = "timestamp with time zone")
  @UpdateTimestamp
  private OffsetDateTime lastUpdatedAt;

  @Enumerated(EnumType.STRING)
  @Column
  private RefusalType refusalReceived;

  @Column(nullable = false, columnDefinition = "BOOLEAN DEFAULT false")
  private boolean invalid;

  @JdbcTypeCode(SqlTypes.JSON)
  @Column(columnDefinition = "jsonb")
  private Map<String, String> sample;

  @JdbcTypeCode(SqlTypes.JSON)
  @Column(columnDefinition = "jsonb")
  private Map<String, String> sampleSensitive;

  @ManyToOne(optional = false)
  private CollectionExercise collectionExercise;

  @OneToMany(mappedBy = "caze")
  List<UacQidLink> uacQidLinks;

  @OneToMany(mappedBy = "caze")
  List<Event> events;
}
