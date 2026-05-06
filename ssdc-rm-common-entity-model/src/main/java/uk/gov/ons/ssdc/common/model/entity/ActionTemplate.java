package uk.gov.ons.ssdc.common.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import java.util.UUID;
import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

@Data
@Entity
@DynamicUpdate
@Table(
    uniqueConstraints =
        @UniqueConstraint(
            name = "uq_action_template_name",
            columnNames = {"name"}))
public class ActionTemplate {

  @Id private UUID id;

  @Column(nullable = false, length = 255)
  private String name;

  @ManyToOne(optional = false)
  private Survey survey;
}
