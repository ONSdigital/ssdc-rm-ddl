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
            name = "uq_mi_email_request",
            columnNames = {"collection_exercise_id", "pack_code", "snapshot_date"}))
public class MiEmailRequest {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @ManyToOne(optional = false)
  private CollectionExercise collectionExercise;

  // Not a FK to EmailTemplate - MI rows are historical snapshots and must survive template deletion
  @Column(nullable = false)
  private String packCode;

  @Column(nullable = false)
  private LocalDate snapshotDate;

  @Column(nullable = false)
  private int dailyEmailRequests;

  @Column(nullable = false)
  private int totalEmailRequests;

  @Column(nullable = false, columnDefinition = "timestamp with time zone")
  private OffsetDateTime createdAt;
}
