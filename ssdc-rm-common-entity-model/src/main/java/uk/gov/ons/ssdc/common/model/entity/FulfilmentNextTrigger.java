package uk.gov.ons.ssdc.common.model.entity;

import java.time.OffsetDateTime;
import java.util.UUID;
import javax.persistence.*;
import lombok.Data;

@Entity
@Data
public class FulfilmentNextTrigger {
  @Id private UUID id;

  @Column(nullable = false, columnDefinition = "timestamp with time zone")
  private OffsetDateTime triggerDateTime;
}
