package sn.jgo.examen.entities;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "demandes")
public class Demande {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String message;

    @ManyToOne
    @JoinColumn(name = "unite_id", nullable = false)
    private Unite unite;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User demandeur;

    @Column(nullable = false)
    private String statut;

    @Column(name = "date_demande", nullable = false)
    private LocalDateTime dateDemande;

    public Demande() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Unite getUnite() {
        return unite;
    }

    public void setUnite(Unite unite) {
        this.unite = unite;
    }

    public User getDemandeur() {
        return demandeur;
    }

    public void setDemandeur(User demandeur) {
        this.demandeur = demandeur;
    }

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

    public LocalDateTime getDateDemande() {
        return dateDemande;
    }

    public void setDateDemande(LocalDateTime dateDemande) {
        this.dateDemande = dateDemande;
    }
}
