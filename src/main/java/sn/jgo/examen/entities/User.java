package sn.jgo.examen.entities;


import javax.persistence.*;
import java.util.List;
import java.util.Random;

@Table(name = "users")
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(length = 50)
    private String nom;
    @Column(length = 100)
    private String prenom;
    @Column(length = 50)
    private String identifiant;
    @Column(length = 200)
    private String mdp;

    public static String abc = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getIdentifiant() {
        return identifiant;
    }

    public void setIdentifiant(String identifiant) {
        this.identifiant = identifiant;
    }

    public String getMdp() {
        return this.mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = crypt(mdp);
    }

    public static String crypt(String str) {
        Random r = new Random();
        // Generating a random number between 1001 (inclusive) and 9900 (inclusive)
        int randomNumber1 = r.nextInt(9900 - 1001 + 1) + 1001;
        String pass = "" + randomNumber1;
        for (int i = 0; i < str.length(); i++) {
            //System.out.println(str.charAt(i));
            char c = str.charAt(i);
            if (c == 'z') {
                pass += 'a';
            } else if (c == 'Z') {
                pass += 'A';
            } else if (abc.contains("" + c)) {
                pass += abc.charAt(abc.indexOf(c) + 1);
            } else {
                pass += str.charAt(i);
            }
        }
        // Generating another random number between 1000 (inclusive) and 9999 (inclusive)
        int randomNumber2 = r.nextInt(9999 - 1000 + 1) + 1000;
        return pass + randomNumber2;
    }


    public static String decrypt(String str){
        String pass = "";
        for (int i = 4; i < str.length()-4; i++) {
            //System.out.println(str.charAt(i));
            char c = str.charAt(i);
            if(c == 'a'){
                pass+= 'z';
            }
            else if(c == 'A'){
                pass+= 'Z';
            }else if (abc.contains(""+c)){
                pass+= abc.charAt(abc.indexOf(c)-1);
            }else{
                pass+=str.charAt(i);
            }
        }
        return pass;
    }

    @ManyToOne
    @JoinColumn(name = "role_id", nullable = false)
    private Role role;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Immeuble> immeubles;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}


