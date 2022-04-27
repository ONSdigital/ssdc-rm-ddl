package src.main.java.uk.gov.ons.ssdc.common.model.entity;

import java.time.temporal.ChronoUnit;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DateOffSet {
  private ChronoUnit dateUnit;
  private int offset;
}
