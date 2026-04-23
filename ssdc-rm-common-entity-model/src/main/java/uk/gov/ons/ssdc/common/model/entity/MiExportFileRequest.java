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
            name = "uq_mi_export_file_request",
            columnNames = {"collection_exercise_id", "pack_code", "snapshot_date"}))
public class MiExportFileRequest {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @ManyToOne(optional = false)
  private CollectionExercise collectionExercise;

  // Not a FK to ExportFileTemplate - MI rows are historical snapshots and must survive template deletion
  @Column(nullable = false)
  private String packCode;

  @Column(nullable = false)
  private LocalDate snapshotDate;

  @Column(nullable = false)
  private int dailyExportFileRequests;

  @Column(nullable = false)
  private int totalExportFileRequests;

  @Column(nullable = false, columnDefinition = "timestamp with time zone")
  private OffsetDateTime createdAt;
}
