package mg.itu.pharmacie.Models.Generalisation.GeneralisationDb;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

// Définir l'annotation
@Retention(RetentionPolicy.RUNTIME) 
@Target({ ElementType.FIELD }) 
public @interface AttributDb { 
    String name() default ""; 
}
