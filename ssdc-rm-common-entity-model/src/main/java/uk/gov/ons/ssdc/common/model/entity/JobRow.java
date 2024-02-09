package uk.gov.ons.ssdc.common.model.entity;

import io.hypersistence.utils.hibernate.type.json.JsonBinaryType;
import jakarta.persistence.*;
import java.nio.charset.Charset;
import java.util.Map;
import java.util.UUID;
import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.annotations.Type;
import org.hibernate.type.SqlTypes;

@Data
@Entity
@DynamicUpdate
public class JobRow {
  @Id private UUID id;

  @ManyToOne(optional = false)
  private Job job;

  @Type(JsonBinaryType.class)
  @Column(columnDefinition = "jsonb")
  private Map<String, String> rowData;

  @Lob
  @JdbcTypeCode(SqlTypes.VARBINARY)
  @Column(nullable = false)
  private byte[][] originalRowData;

  @Column(nullable = false)
  private int originalRowLineNumber;

  @Enumerated(EnumType.STRING)
  @Column(nullable = false)
  private JobRowStatus jobRowStatus;

  @Lob
  @JdbcTypeCode(SqlTypes.VARBINARY)
  @Column
  private byte[] validationErrorDescriptions;

  public void setValidationErrorDescriptions(String validationErrorDescriptionsStr) {
    if (validationErrorDescriptionsStr == null) {
      validationErrorDescriptions = null;
    } else {
      validationErrorDescriptions = validationErrorDescriptionsStr.getBytes();
    }
  }

  public String getValidationErrorDescriptions() {
    if (validationErrorDescriptions == null) {
      return null;
    }

    return new String(validationErrorDescriptions);
  }

  public String[] getOriginalRowData() {

    return convertToStrings(originalRowData);
  }

  public void setOriginalRowData(String[] originalRowDataStr) {
    originalRowData = convertToBytes(originalRowDataStr);
  }

  private static String[] convertToStrings(byte[][] byteStrings) {
    String[] data = new String[byteStrings.length];
    for (int i = 0; i < byteStrings.length; i++) {
      data[i] = new String(byteStrings[i], Charset.defaultCharset());
    }
    return data;
  }

  private static byte[][] convertToBytes(String[] strings) {
    byte[][] data = new byte[strings.length][];
    for (int i = 0; i < strings.length; i++) {
      String string = strings[i];
      data[i] = string.getBytes(Charset.defaultCharset()); // you can chose charset
    }
    return data;
  }
}
