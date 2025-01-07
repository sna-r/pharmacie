package mg.itu.pharmacie.Models.Generalisation.GeneralisationDb;

import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;


public class DB {
    // ****************** GET ALL GENERALISER *******************************
    // get parametre query by class 
    public static String[][] generateParamQueryByClass(Object table) throws Exception {
        String[][] result = new String[4][];
        result[0] = new String[1]; 
        result[3] = new String[2];
        String nameTable = null;

        Class<?> classTable = table.getClass();
        if (!classTable.isAnnotationPresent(TableDb.class)) 
            throw new Exception("Le classe '" + classTable.getSimpleName() + "' n'est pas relier a une table");
        TableDb annotation = classTable.getAnnotation(TableDb.class);
        result[0][0] = annotation.name(); // nom table
        int i = 0;
        for (Field field : classTable.getDeclaredFields()) {
            if (field.isAnnotationPresent(AttributDb.class))
                i++;
        }

        result[1] = new String[i];
        result[2] = new String[i];
        if (i == 0)
            throw new Exception("Il n'y a aucun attribut dans votre classe '" + classTable.getSimpleName()
            + "' qui se relie a un table '" + result[0][0] + "'");
        i = 0;
        for (Field field : classTable.getDeclaredFields()) {
            if (field.isAnnotationPresent(AttributDb.class)) {
                result[1][i] = field.getName(); // nom field
                result[2][i] = field.getAnnotation(AttributDb.class).name(); // nom attribut base

                if (field.isAnnotationPresent(PrimaryKeyDb.class)) {
                    result[3][0] = field.getName();
                    result[3][1] = field.getAnnotation(AttributDb.class).name();
                }
                i++;
            }
        } 

        return result;
    }
    // ** get list generalise
    public static Object getList(Object table, Connection connection) throws Exception {
        String[][] infoTable = DB.generateParamQueryByClass(table);
        String nameTable = infoTable[0][0];
        String attrs = "";
        int i = 0;
        for (String attrTable : infoTable[2]) {
            if (i > 0)
                attrs = attrs + " , ";
            attrs = attrs + attrTable;
            i++;
        }
        i = 0;

        Class<?> classTable = table.getClass();
        String query = "SELECT " + attrs + " FROM " + nameTable;
        Object[] result;
        int size = 0;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        boolean statementOpen = false;
        boolean resultsetOpen = false;
        try {
            if (connection == null)
                throw new Exception("Get by Id error du class '" + table.getClass().getSimpleName()
                        + "' :  Le connexion qui prend les '" + nameTable + "' n'est pas ouvert");

            statement = connection.prepareStatement(query);
            statementOpen = true;
            resultset = statement.executeQuery();
            while (resultset.next()) {
                size++;
            }
            if (size == 0) {
                result = (Object[]) Array.newInstance(classTable, 0);
            } else {
                result = (Object[]) Array.newInstance(classTable, size);
                i = 0;
                resultset = statement.executeQuery();
                resultsetOpen = true;
                int j = 0;
                while (resultset.next()) {
                    Constructor<?> constructor = classTable.getConstructor();
                    result[i] = constructor.newInstance();
                    for (Field field : result[i].getClass().getDeclaredFields()) {
                        j = 0;
                        for (String nameAttribut : infoTable[1]) {
                            if (field.getName().compareToIgnoreCase(nameAttribut) == 0) {
                                field.setAccessible(true);
                                // if ((field.isAnnotationPresent(PrimaryKeyDb.class))) {
                                    
                                // } else {
                                    if (field.getType().getName().equals("int")) {
                                        int value = resultset.getInt(infoTable[2][j]);
                                        field.set(result[i], value);
                                    } else if (field.getType().getName().equals("java.lang.String")) {
                                        String value = resultset.getString(infoTable[2][j]);
                                        field.set(result[i], value);
                                    } else if (field.getType().getName().equals("boolean")) {
                                        boolean value = resultset.getBoolean(infoTable[2][j]);
                                        field.set(result[i], value);
                                    } else if (field.getType().getName().equals("double")) {
                                        double value = resultset.getDouble(infoTable[2][j]); 
                                        field.set(result[i], value);
                                    } else if (field.isAnnotationPresent(ForeignKeyDb.class)) {
                                        Constructor<?> construtorField = (field.getType()).getConstructor();
                                        field.set(result[i], getById(construtorField.newInstance(), connection));
                                    } else {
                                        throw new Exception("Get by Id error du class '"
                                                + table.getClass().getSimpleName()
                                                + "' :  Type non pris en charge pour le champ " + field.getName());
                                    }
                                // }
                            }
                            j++;
                        }
                    }
                    i++;
                }
            }
            statement.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        } finally {
            if (statementOpen) {
                statement.close();
            }
            if (resultsetOpen) {
                resultset.close();
            }
        }

        return result;
    }

    // ** get by id
    public static Object getById(Object table, Connection connection) throws Exception {
        String[][] infoTable = DB.generateParamQueryByClass(table);

        if (infoTable[3][0] == null || infoTable[3][0].isEmpty())
            throw new Exception("Get by Id error du class '" + table.getClass().getSimpleName() + "' : pas indication Primary key");
            
        

        String nameTable = infoTable[0][0];
        String attrs = "";
        int i = 0;
        for (String attrTable : infoTable[2]) {
            if (i > 0)
                attrs = attrs + " , ";
            attrs = attrs + attrTable;
            i++;
        }
        i = 0;

        Class<?> classTable = table.getClass();
        String query = "SELECT " + attrs + " FROM " + nameTable + " where " + infoTable[3][1] + " = ? ";
        Object result = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        boolean statementOpen = false;
        boolean resultsetOpen = false;
        try {
            if (connection == null)
                throw new Exception("Get by Id error du class '" + table.getClass().getSimpleName()
                        + "' :  Le connexion qui prend les '" + nameTable + "' n'est pas ouvert");

            statement = connection.prepareStatement(query);
            Field fieldPrimaryKey = classTable.getDeclaredField(infoTable[3][0]);

            fieldPrimaryKey.setAccessible(true); 
            if (fieldPrimaryKey.getType().getName().equals("int")) {
                statement.setInt(1, (int) fieldPrimaryKey.get(table));
            } else if (fieldPrimaryKey.getType().getName().equals("java.lang.String")) {
                statement.setString(1, (String) fieldPrimaryKey.get(table));
            } else if (fieldPrimaryKey.getType().getName().equals("boolean")) {
                statement.setBoolean(1, (boolean) fieldPrimaryKey.get(table));
            } else if (fieldPrimaryKey.getType().getName().equals("double")) {
                statement.setDouble(1, (double) fieldPrimaryKey.get(table));
            } else if (fieldPrimaryKey.getType().getSimpleName().equals("DateHeure")) {
                Object fieldValue = fieldPrimaryKey.get(table);
                if (fieldValue != null) {
                    try {
                        Method toTimestampMethod = fieldValue.getClass().getMethod("toTimestamp");
                        Timestamp timestamp = (Timestamp) toTimestampMethod.invoke(fieldValue);
                        statement.setTimestamp(1, timestamp);
                    } catch (NoSuchMethodException e) {
                        throw new Exception("La methode toTimestamp() est introuvable dans la classe "
                                + fieldPrimaryKey.getType().getName());
                    } catch (IllegalAccessException | InvocationTargetException e) {
                        throw new Exception("Erreur lors de l'appel de la méthode toTimestamp() pour le champ "
                                + fieldPrimaryKey.getName());
                    } catch (Exception e) {
                        throw e;
                    }
                } else {
                    statement.setNull(1, java.sql.Types.TIMESTAMP);
                }
            } else {
                throw new Exception("Get by Id error du class '" + table.getClass().getSimpleName()
                        + "' :  Type non pris en charge pour le champ " + fieldPrimaryKey.getName());
            }

            statementOpen = true;

            resultset = statement.executeQuery();
            resultsetOpen = true;
            int j = 0;
            while (resultset.next()) {
                Constructor<?> constructor = classTable.getConstructor();
                result = constructor.newInstance(); 
                for (Field field : result.getClass().getDeclaredFields()) {
                    j = 0;
                    for (String nameAttribut : infoTable[1]) {
                        if (field.getName().compareToIgnoreCase(nameAttribut) == 0) {
                            field.setAccessible(true);

                            if (field.getType().getName().equals("int")) {
                                int value = resultset.getInt(infoTable[2][j]);
                                field.set(result, value);
                            } else if (field.getType().getName().equals("java.lang.String")) {
                                String value = resultset.getString(infoTable[2][j]);
                                field.set(result, value);
                            } else if (field.getType().getName().equals("boolean")) {
                                boolean value = resultset.getBoolean(infoTable[2][j]);
                                field.set(result, value);
                            } else if (field.getType().getName().equals("double")) {
                                double value = resultset.getDouble(infoTable[2][j]);
                                field.set(result, value);
                            } else if (field.isAnnotationPresent(ForeignKeyDb.class)) {
                                    Constructor<?> construtorField = (field.getType()).getConstructor();
                                    field.set(result, getById(construtorField.newInstance(), connection));
                            } else {
                                throw new Exception("Get by Id error du class '" + table.getClass().getSimpleName()
                                        + "' :  Type non pris en charge pour le champ " + field.getName());
                            }
                        }
                        j++;
                    }
                }

            }
            statement.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        } finally {
            if (statementOpen) {
                statement.close();
            }
            if (resultsetOpen) {
                resultset.close();
            }
        }

        return result;
    }

    // *********************** BUILD TABLE ***********************************
    public static String buildHeadTable(Object object) throws Exception {
        String result = "";
        Class<?> classTable = object.getClass();
        for (Field field : classTable.getDeclaredFields()) {
            if (field.isAnnotationPresent(ShowTable.class)) {
                result += "<th>" + field.getAnnotation(ShowTable.class).name() + "</th>";
            }
        }
        return result;
    } 
    
    public static String buildBodyTable(Object objs) throws Exception {
        Object[] objects = (Object[]) objs;
        String result = "";
        for (Object object : objects) {
            result += "<tr>";
            Class<?> classTable = object.getClass();
            for (Field field : classTable.getDeclaredFields()) {
                if (field.isAnnotationPresent(ShowTable.class)) {
                    field.setAccessible(true);

                    try {
                        Object value = field.get(object);
                        result += "<td>" + (value != null ? value : "") + "</td>";
                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                    }
                }
            }
            result += "</tr>";
        }

        return result;
    }

    public static String buildTotaleTable(Object objs, Object objec) throws Exception {
        double[] sum = null;
        double[] avg = null;
        String[] prints = null; 
        int numberI = 0;
        Field[] fields = objec.getClass().getDeclaredFields();
        for (Field fd : fields) {
            Class<?> fieldType = fd.getType(); // Obtenir le type du champ
            if (fieldType == int.class) {
                numberI++;
            } else if (fieldType == double.class) {
                numberI++;
            } 
        }
        sum = new double[numberI];
        for (int i = 0; i < sum.length; i++) {
            sum[i] = 0;
        }
        avg = new double[numberI];
        prints = new String[numberI];

        int j = 0;
        for (Field fds : fields) {
            Class<?> fieldTypes = fds.getType(); // Obtenir le type du champ
            if (fieldTypes == int.class) {
                prints[j] = "\n" + fds.getName() + " : ";
                j++;
            } else if (fieldTypes == double.class) {
                prints[j] = "\n" + fds.getName() + " : ";
                j++;
            }
        }

        Object[] objects = (Object[]) objs;
        String result = "";
        for (Object object : objects) {
            int i = 0;
            result += "<tr>";
            Class<?> classTable = object.getClass();
            for (Field field : classTable.getDeclaredFields()) {
                if (field.isAnnotationPresent(ShowTable.class)) {
                    field.setAccessible(true);

                    try {
                        Object value = field.get(object);
                        result += "<td>" + (value != null ? value : "") + "</td>";
                        Class<?> fieldTyp = field.getType(); // Obtenir le type du champ

                        if (fieldTyp == int.class) {
                            sum[i] = sum[i] + (int) value;
                            i++;
                        }else if (fieldTyp == double.class) {
                            sum[i] = sum[i] + (double) value;
                            i++;
                        }
                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                    }
                }
            }
            result += "</tr>";
        }
        int k = 0; 
        result = "";
        for (double somme : sum) {
            avg[k] = somme / objects.length;
            prints[k] = prints[k] + " | somme " + somme + " | moyenne :  " + avg[k];
            result = result + "<p>" + prints[k] + "</p>\n";
            k++;            
        }

        return result;
    }
    
    public static String getListShowTable(Object table, boolean setTotale, Connection connection) throws Exception {
        Object[] objects = (Object[]) DB.getList(table, connection);
        String heads = DB.buildHeadTable(table);
        String header = "<tr>" + heads + "</tr>";
        String body = DB.buildBodyTable(objects);
        String result = "<table>" + header + " \n " + body + "</table>";
        if (setTotale) {
            String resultTotale = DB.buildTotaleTable(objects, table);
            result = resultTotale + result;
        }
        return result;
    }

    public static String getListShowTableByObject(Object table,Object[] objects , boolean setTotale, Connection connection) throws Exception {
        // Object[] objects = (Object[]) DB.getList(table, connection);
        String heads = DB.buildHeadTable(table);
        String header = "<tr>" + heads + "</tr>";
        String body = DB.buildBodyTable(objects);
        String result = "<table>" + header + " \n " + body + "</table>";
        if (setTotale) {
            String resultTotale = DB.buildTotaleTable(objects, table);
            result = resultTotale + result;
        }
        return result;
    }
    
    // ** insert generalise
    public static void insert(Object table, Connection connection) throws Exception {
        String[][] infoTable = DB.generateParamQueryByClass(table);
        String nameTable = infoTable[0][0];
        String attrs = "";
        String values = "";
        int i = 0;
        for (String attrTable : infoTable[2]) {
            if (i > 0) {   
                attrs = attrs + " , ";
                values = values + " , ";
            }
            attrs = attrs + attrTable;
            values = values + " ? ";
            i++;
        }
        i = 0;

        Class<?> classTable = table.getClass();
        String query = "INSERT INTO " + nameTable + "(" + attrs + ") VALUES (" + values + " )";
        PreparedStatement statement = null;
        boolean statementOpen = false;
        try {
            if (connection == null) 
                throw new Exception("Get by Id error du class '" + table.getClass().getSimpleName()
                        + "' :  Le connexion qui prend les '" + nameTable + "' n'est pas ouvert");
            
            statement = connection.prepareStatement(query);
            statementOpen = true;
            int indexValues = 1;
            
            
            for (Field field : classTable.getDeclaredFields()) {
                if (field.isAnnotationPresent(AttributDb.class)) {
                    field.setAccessible(true);
                    if (field.getType().getName().equals("int")) {
                        statement.setInt(indexValues, (int) field.get(table));
                    } else if (field.getType().getName().equals("java.lang.String")) {
                        statement.setString(indexValues, (String) field.get(table));
                    } else if (field.getType().getName().equals("boolean")) {
                        statement.setBoolean(indexValues, (boolean) field.get(table));
                    } else if (field.getType().getName().equals("double")) {
                        statement.setDouble(indexValues, (double) field.get(table));
                    } else if (field.getType().getSimpleName().equals("DateHeure")) {
                        Object fieldValue = field.get(table);
                        if (fieldValue != null) {
                            try {
                                Method toTimestampMethod = fieldValue.getClass().getMethod("toTimestamp");
                                Timestamp timestamp = (Timestamp) toTimestampMethod.invoke(fieldValue);
                                statement.setTimestamp(indexValues, timestamp);
                            } catch (NoSuchMethodException e) {
                                throw new Exception("La methode toTimestamp() est introuvable dans la classe "
                                        + field.getType().getName());
                            } catch (IllegalAccessException | InvocationTargetException e) {
                                throw new Exception("Erreur lors de l'appel de la méthode toTimestamp() pour le champ "
                                        + field.getName());
                            } catch (Exception e) {
                                throw e;
                            } 
                        } else {
                            statement.setNull(indexValues, java.sql.Types.TIMESTAMP);
                        }
                    } else {
                        throw new Exception("Get by Id error du class '" + table.getClass().getSimpleName()
                                + "' :  Type non pris en charge pour le champ " + field.getName());
                    }
                    indexValues++;
                }
            }
            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        } finally {
            if (statementOpen) {
                statement.close();
            }
            
        }

        
        // return result;
    }
}
