package uk.gov.ons.ssdc.common.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import lombok.Data;

@Data
@Entity
@Table(
    uniqueConstraints =
        @UniqueConstraint(
            name = "uq_mi_response_rate",
            columnNames = {"collection_exercise_id", "snapshot_date"}))
public class MiResponseRate {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @ManyToOne(optional = false)
  private CollectionExercise collectionExercise;

  @Column(nullable = false)
  private LocalDate snapshotDate;

  @Column(nullable = false)
  private int receiptedCount;

  @Column(nullable = false)
  private int launchedCount;

  @Column(nullable = false)
  private int totalCaseCount;

  @Column(nullable = false, columnDefinition = "timestamp with time zone")
  private OffsetDateTime createdAt;
}
