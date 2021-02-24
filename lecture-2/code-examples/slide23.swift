func message(shouldIncludeAge: Bool) -> String {
  if shouldIncludeAge {
	  return "С днем рождения, \(birthdayName)! Тебе \(birthdayAge)."
  }
  return "С днем рождения,\(birthdayName)!"
}
