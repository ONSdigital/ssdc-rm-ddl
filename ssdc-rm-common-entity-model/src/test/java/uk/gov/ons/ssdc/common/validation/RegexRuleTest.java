package uk.gov.ons.ssdc.common.validation;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Optional;
import org.junit.jupiter.api.Test;

class RegexRuleTest {
  private static final String TEST_UK_MOBILE_REGEX = "^07[0-9]{9}$";
  private static final String TEST_UK_MOBILE_REGEX_USER_FRIENDLY_ERROR =
      "Invalid UK mobile phone number";

  @Test
  void checkValidityValidPhoneNumber() {
    RegexRule underTest =
        new RegexRule(TEST_UK_MOBILE_REGEX, TEST_UK_MOBILE_REGEX_USER_FRIENDLY_ERROR);

    Optional<String> actualResult = underTest.checkValidity("07123456789");
    assertThat(actualResult.isPresent()).isFalse();
  }

  @Test
  void checkValidityInvalidPhoneNumberNonNumeric() {
    RegexRule underTest =
        new RegexRule(TEST_UK_MOBILE_REGEX, TEST_UK_MOBILE_REGEX_USER_FRIENDLY_ERROR);

    Optional<String> actualResult = underTest.checkValidity("07123456xxx");
    assertThat(actualResult.isPresent()).isTrue();
    assertThat(actualResult.get()).isEqualTo(TEST_UK_MOBILE_REGEX_USER_FRIENDLY_ERROR);
  }

  @Test
  void checkValidityInvalidPhoneNumberTooShort() {
    RegexRule underTest =
        new RegexRule(TEST_UK_MOBILE_REGEX, TEST_UK_MOBILE_REGEX_USER_FRIENDLY_ERROR);

    Optional<String> actualResult = underTest.checkValidity("0712345");
    assertThat(actualResult.isPresent()).isTrue();
    assertThat(actualResult.get()).isEqualTo(TEST_UK_MOBILE_REGEX_USER_FRIENDLY_ERROR);
  }

  @Test
  void checkValidityInvalidPhoneNumberTooLong() {
    RegexRule underTest =
        new RegexRule(TEST_UK_MOBILE_REGEX, TEST_UK_MOBILE_REGEX_USER_FRIENDLY_ERROR);

    Optional<String> actualResult = underTest.checkValidity("07123456789123456789");
    assertThat(actualResult.isPresent()).isTrue();
    assertThat(actualResult.get()).isEqualTo(TEST_UK_MOBILE_REGEX_USER_FRIENDLY_ERROR);
  }
}
