package uk.gov.ons.ssdc.common.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

@ToString(onlyExplicitlyIncluded = true) // Bidirectional relationship causes IDE stackoverflow
@Data
@Entity
@DynamicUpdate
public class CollectionExercise {
  @Id private UUID id;

  @Column(nullable = false)
  private String name;

  @ManyToOne(optional = false)
  private Survey survey;

  @OneToMany(mappedBy = "collectionExercise")
  private List<Case> cases;

  @OneToMany(mappedBy = "collectionExercise")
  private List<ActionRule> actionRules;

  @OneToMany(mappedBy = "collectionExercise")
  private List<Job> jobs;

  @Column(nullable = false)
  private String reference;

  @Column(nullable = false, columnDefinition = "timestamp with time zone")
  private OffsetDateTime startDate;

  @Column(nullable = false, columnDefinition = "timestamp with time zone")
  private OffsetDateTime endDate;

  @JdbcTypeCode(SqlTypes.JSON)
  @Column(columnDefinition = "jsonb")
  private Object metadata;

  @JdbcTypeCode(SqlTypes.JSON)
  @Column(nullable = false, columnDefinition = "jsonb")
  private CollectionInstrumentSelectionRule[] collectionInstrumentSelectionRules;
}
