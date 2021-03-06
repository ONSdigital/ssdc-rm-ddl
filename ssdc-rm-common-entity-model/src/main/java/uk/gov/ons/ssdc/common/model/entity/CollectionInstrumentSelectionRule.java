package uk.gov.ons.ssdc.common.model.entity;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.io.Serializable;
import lombok.Getter;

@Getter
public class CollectionInstrumentSelectionRule implements Serializable {
  private final int priority;
  private final String spelExpression;
  private final String collectionInstrumentUrl;

  @JsonCreator
  public CollectionInstrumentSelectionRule(
      @JsonProperty("priority") int priority,
      @JsonProperty("spelExpression") String spelExpression,
      @JsonProperty("collectionInstrumentUrl") String collectionInstrumentUrl) {
    this.priority = priority;
    this.spelExpression = spelExpression;
    this.collectionInstrumentUrl = collectionInstrumentUrl;
  }
}
