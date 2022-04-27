package src.main.java.uk.gov.ons.ssdc.common.model.entity;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ScheduleTemplate implements Serializable {
  private String name;
  private ScheduleTemplateTaskGroup[] scheduleTemplateTaskGroups;
}
