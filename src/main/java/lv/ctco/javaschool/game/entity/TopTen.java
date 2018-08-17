package lv.ctco.javaschool.game.entity;

/**
 * Created by gatis.laizans01 on 8/17/2018.
 */
import lombok.Data;
import lv.ctco.javaschool.auth.entity.domain.User;

import javax.persistence.*;

@Data
@Entity
public class TopTen {
    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne
    private User player;

    private int score;


}
