package mg.itu.pharmacie.Models.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;

public class DateHeure {
	LocalDate date;
	LocalTime heure;
	
	// setters et getters normal
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public void setTime(LocalTime heure) {
		this.heure = heure;
	}
	public LocalDate getDate() {
		return date;
	}

	public LocalTime getHeure() {
		return heure;
	}
	
	// to timestamp 
	public Timestamp toTimestamp() {
		LocalDateTime localDateTime = this.toLocalDateTime();
		return Timestamp.valueOf(localDateTime);
	}
	// 
	public static DateHeure addMonthsToDate(DateHeure dateHeure, int months) {
		// Ajouter les mois à la date existante
		LocalDate newDate = dateHeure.getDate().plusMonths(months);

		// Créer un nouvel objet DateHeure avec la nouvelle date et la même heure
		DateHeure newDateHeure = new DateHeure();
		newDateHeure.setDate(newDate);
		newDateHeure.setTime(dateHeure.getHeure());

		return newDateHeure;
	}
	// nombre mois entre deux date
	public static int getNumberOfMonthsBetween(DateHeure start, DateHeure end) {
		// Récupérer l'année et le mois de la date de départ
		int startMonth = start.getDate().getYear() * 12 + start.getDate().getMonthValue();

		// Récupérer l'année et le mois de la date de fin
		int endMonth = end.getDate().getYear() * 12 + end.getDate().getMonthValue();

		// Calculer la différence en mois, en incluant le mois de départ
		return endMonth - startMonth + 1;
	}

	// setters et getters en string
	public void setDate(String date) throws Exception {
		if(date.trim().isEmpty()) {throw new Exception("Le date a inserer est vide");}
		String dates[] = date.split("-");
		int anne = Integer.parseInt(dates[0]);
		int mois = Integer.parseInt(dates[1]);
		int jour = Integer.parseInt(dates[2]);
		this.date = LocalDate.of(anne,mois,jour);
	}
	public String getDateString() {
		return date.toString();
	}
	public void setTime(String time) throws Exception{
		if(time.trim().isEmpty()) {throw new Exception("L'heure a inserer est vide");}
		String times[] = time.split(":");
		int heure = Integer.parseInt(times[0]);
		int min = Integer.parseInt(times[1]);
		int sec = Integer.parseInt(times[2]);
		this.heure = LocalTime.of(heure,min,sec);
	}
	public String getTimeString() {
		String val = heure.toString();
		if (heure.toString().length()==5) {
			val = heure.toString()+":00";
		}
		return val;
	}
	public String getDateTimeString(){
		return getDateString()+" "+getTimeString();
	}
	
	// fonction comparer date
	public boolean isAfterTo(DateHeure date1) {
		if (date.isAfter(date1.getDate())) {
			return true;
		} else if (date1.getDate().isAfter(date)) {
			return false;
		} else {
			if (heure.isAfter(date1.getHeure())) {
				return true;
			} else if (date1.getHeure().isAfter(heure)) {
				return false;
			} else {
				return false;
			}
		}
	}
	
	public LocalDateTime toLocalDateTime() {
		return LocalDateTime.of(date, heure);
	}

	public static double getAnneBySubtractTwoDate(DateHeure dateHeure1, DateHeure dateHeure2) {
		return convertSecondsToYears(subtractDateHeure(dateHeure1, dateHeure2));
	}
	
	public static double convertSecondsToYears(double seconds) {
		// Nombre de secondes dans une année (en tenant compte des années bissextiles)
		double secondsInYear = 365.25 * 24 * 60 * 60;
		// Calculer le nombre d'années
		double years = seconds / secondsInYear;
		return years;
	}
	// fonction soustraction entre deux temps
	public static double subtractDateHeure(DateHeure dateHeure1, DateHeure dateHeure2) {
		//date1 : apres -- date2 : avant
        LocalDateTime dateTime1 = dateHeure1.toLocalDateTime();
        LocalDateTime dateTime2 = dateHeure2.toLocalDateTime();
		return (double) ChronoUnit.SECONDS.between(dateTime2, dateTime1);
    }

	// fonction avoir le temps actuelle
	public static DateHeure getCurrentDateHeure() {
		DateHeure currentDateHeure = new DateHeure();
		currentDateHeure.setDate(LocalDate.now());
		currentDateHeure.setTime(LocalTime.now());
		return currentDateHeure;
	}
	// fonction avoir le temps en donant un date
	public static String convertSecondsToString(double seconds) {
		if (seconds==0) {
			return "0 seconde";
		}
		int century = (int) (seconds / (100 * 365.25 * 24 * 60 * 60));
		seconds %= 100 * 365.25 * 24 * 60 * 60;

		int years = (int) (seconds / (365.25 * 24 * 60 * 60));
		seconds %= 365.25 * 24 * 60 * 60;

		int months = (int) (seconds / (30 * 24 * 60 * 60));
		seconds %= 30 * 24 * 60 * 60;

		int days = (int) (seconds / (24 * 60 * 60));
		seconds %= 24 * 60 * 60;

		int hours = (int) (seconds / (60 * 60));
		seconds %= 60 * 60;

		int minutes = (int) (seconds / 60);
		seconds %= 60;

		int secs = (int) seconds;

		StringBuilder result = new StringBuilder();
		if (century > 0) {	
			result.append(century).append(" siècle");
			if (century>1) result.append("s");
		}
		if (years > 0){
			result.append(" ");
			result.append(years).append(" année");
			if(years>1) result.append("s");
		}
		if (months > 0){
			result.append(" ");
			result.append(months).append(" mois");
		}
		if (days > 0){
			result.append(" ");
			result.append(days).append(" jour");
			if(days>1) result.append("s");
		}
		if (hours > 0){
			result.append(" ");
			result.append(hours).append(" heure");
			if(hours>1) result.append("s");
		}
		if (minutes > 0){
			result.append(" ");
			result.append(minutes).append(" minute");
			if(minutes>1) result.append("s");
		}
		if (secs > 0){
			result.append(" ");
			result.append(secs).append(" seconde");
			if(secs>1) result.append("s");
		}

		return result.toString().trim();
	}

	// fonction pour connaitre le jour d'un date
	public int getTypeDay() {
		String dateStr = this.getDateString();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date = sdf.parse(dateStr);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);

            // Calendar.DAY_OF_WEEK commence à 1 pour dimanche, nous voulons commencer à 1 pour lundi
            int numeroJour = (calendar.get(Calendar.DAY_OF_WEEK) + 5) % 7 + 1;

            return numeroJour;
        } catch (ParseException e) {
            e.printStackTrace();
            return -1; // Erreur de parsing de la date
        }
    }
	public String getTypeDayString(){
		int type = getTypeDay();
		if (type==1) {return "Lundi";}
		if (type==2) {return "Mardi";}
		if (type==3) {return "Mercredi";}
		if (type==4) {return "Jeudi";}
		if (type==5) {return "Vendredi";}
		if (type==6) {return "Samedi";}
		return "Dimanche";
	}

	public DateHeure addSeconds(int seconds) {
		int hoursToAdd = (int) (seconds / 3600);
		int minutesToAdd = (int) ((seconds % 3600) / 60);
		int secondsToAdd = (int) (seconds % 60);
	
		LocalTime newTime = this.heure.plusHours(hoursToAdd).plusMinutes(minutesToAdd).plusSeconds(secondsToAdd);
	
		// Check if there is a date change
		LocalDate newDate = this.date;
		if (newTime.isBefore(this.heure)) {
			newDate = this.date.plusDays(1);
		}
	
		DateHeure newDateTime = new DateHeure();
		newDateTime.setDate(newDate);
		newDateTime.setTime(newTime);
	
		return newDateTime;
	}
	
	public DateHeure addSecondToDate(double seconde) {
		long secondeEntieres = (long) seconde;
		long nanos = (long) ((seconde - secondeEntieres) * 1_000_000_000);
		LocalTime newTime = this.heure.plusSeconds(secondeEntieres).plusNanos(nanos);

		// Vérifier s'il y a un changement de jour
		LocalDate newDate = this.date;
		if (newTime.isBefore(this.heure)) {
			newDate = this.date.plusDays(1);
		}

		newDate = newDate.plusDays(secondeEntieres / 86400);
		newTime = newTime.plusSeconds(secondeEntieres % 86400);

		DateHeure newDateTime = new DateHeure();
		newDateTime.setDate(newDate);
		newDateTime.setTime(newTime);

		return newDateTime;
	}

	public int getTypeMois() {
		return this.getDate().getMonthValue();
	}

	public boolean isYear(int year) {
		return this.date.getYear() == year;
	}

	public int getYear() {
		return this.date.getYear();
	}
	
	public String getMonthType() {
		int month = this.getDate().getMonthValue();
		switch (month) {
			case 1:
				return "Janvier";
			case 2:
				return "Février";
			case 3:
				return "Mars";
			case 4:
				return "Avril";
			case 5:
				return "Mai";
			case 6:
				return "Juin";
			case 7:
				return "Juillet";
			case 8:
				return "Août";
			case 9:
				return "Septembre";
			case 10:
				return "Octobre";
			case 11:
				return "Novembre";
			case 12:
				return "Décembre";
			default:
				return "Mois invalide";
		}
	}
	
	// fonction pour ajouter du seconde dans le date
	public DateHeure addSeconds(double seconds) {
		int hoursToAdd = (int) (seconds / 3600);
		int minutesToAdd = (int) ((seconds % 3600) / 60);
		int secondsToAdd = (int) (seconds % 60);
		System.out.println(seconds+" "+hoursToAdd+" "+minutesToAdd+" "+secondsToAdd);
		
		LocalTime newTime = this.heure.plusHours(hoursToAdd).plusMinutes(minutesToAdd).plusSeconds(secondsToAdd);
	
		// Check if there is a date change
		LocalDate newDate = this.date;
		if (newTime.isBefore(this.heure)) {
			newDate = this.date.plusDays(1);
		}
	 
		DateHeure newDateTime = new DateHeure();
		newDateTime.setDate(newDate);
		newDateTime.setTime(newTime);
		return newDateTime;
	}

	// modifier un heure en double (exemple 1h est 1 , 0h30 est 0.5 ...)
	public double getDoubleTime() {
		int hours = heure.getHour();
		int minutes = heure.getMinute();
		int seconds = heure.getSecond();

		double doubleTime = hours + (minutes / 60.0) + (seconds / 3600.0);

		return doubleTime;
	}

	public static int differenceTo(DateHeure before, DateHeure after) {
		LocalDateTime dateTimeBefore = before.toLocalDateTime();
		LocalDateTime dateTimeAfter = after.toLocalDateTime();

		// Calculer la différence en secondes
		long differenceInSeconds = ChronoUnit.SECONDS.between(dateTimeBefore, dateTimeAfter);

		// Retourner la différence en tant qu'entier
		return (int) differenceInSeconds;
	}
	
	
	// constructeurs
	public DateHeure(String date, String heure) throws Exception{
		setDate(date);
		setTime(heure);
	}
	public DateHeure(String dateHeure) throws Exception{
		if(dateHeure.length() >= 20) {
		dateHeure = (dateHeure.split("\\."))[0];}
		String[] dateHeures = dateHeure.split(" ");
		setDate(dateHeures[0]);
		setTime(dateHeures[1]);
	}
	public DateHeure(){}
}
