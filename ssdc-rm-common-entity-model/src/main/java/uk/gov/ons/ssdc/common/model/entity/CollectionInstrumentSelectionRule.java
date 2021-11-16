package uk.gov.ons.ssdc.common.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CollectionInstrumentSelectionRule {
  private int priority;
  private String spelExpression;
  private String collectionInstrumentUrl;
}
