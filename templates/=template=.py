#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © %YEAR% %USER% <%MAIL%>
#
# Distributed under terms of the %LICENSE% license.

"""
%HERE%
"""
import argparse


def main(args):
    print(args._in)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument("-_in", type=str,
            required=True)

    args = parser.parse_args()

    main(args)
