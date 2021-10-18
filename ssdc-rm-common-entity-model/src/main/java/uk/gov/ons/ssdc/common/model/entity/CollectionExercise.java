package uk.gov.ons.ssdc.common.model.entity;

import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

@ToString(onlyExplicitlyIncluded = true) // Bidirectional relationship causes IDE stackoverflow
@Data
@TypeDefs({@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)})
@Entity
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

  @Type(type = "jsonb")
  @Column(columnDefinition = "jsonb")
  private Object metadata;
}
