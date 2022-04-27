package src.main.java.uk.gov.ons.ssdc.common.model.entity;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScheduleTemplateTaskGroup {
  private String name;
  // Use OffSet Date thingy instead
  private DateOffSet dateOffsetFromTaskGroupStart;
  private List<ScheduleTemplateTask> scheduleTemplateTasks;
}
