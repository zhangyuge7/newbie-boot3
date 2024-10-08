package com.newbie.generator.domain;

import lombok.Data;

@Data
public class GenerateBody {
    private String[] tableNames;
    private String configId;
}
