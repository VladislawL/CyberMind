package com.mrkdiplom.cybermind.web.converter;

import com.mrkdiplom.cybermind.core.entity.Tag;
import org.springframework.core.convert.converter.Converter;

public class StringToTagConverter implements Converter<String, Tag> {

    @Override
    public Tag convert(String s) {
        return new Tag(s);
    }

}
