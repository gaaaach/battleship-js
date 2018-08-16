package lv.ctco.javaschool.game.entity;

import lombok.Data;

@Data
public class CellStateDto {
    private String address;
    private CellState state;
    private boolean targetArea;
}
