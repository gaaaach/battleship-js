package lv.ctco.javaschool.game.entity;

import lombok.Data;

@Data
public class GameDto {
    private GameStatus status;
    private boolean playerActive;
}
