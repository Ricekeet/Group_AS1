package bean;

public class AreaDetails {

    private int code;
    private int level;
    private int geographicAreaId;
    private int combined;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getGeographicAreaId() {
        return geographicAreaId;
    }

    public void setGeographicAreaId(int geographicAreaId) {
        this.geographicAreaId = geographicAreaId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private String name;



    public int getCombined() {
        return combined;
    }

    public void setCombined(int combined) {
        this.combined = combined;
    }

    @Override
    public String toString() {
        return "Geographic Area Details" +
                "name: " + name +
                ", level: " + level +
                ", code: " + code +
                ", population='" + combined + '\'' ;
    }
}
