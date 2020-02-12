Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C4D159FA9
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 04:54:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7386F204E4;
	Wed, 12 Feb 2020 03:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDwNqTIRvhXZ; Wed, 12 Feb 2020 03:54:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CE8D2204B4;
	Wed, 12 Feb 2020 03:54:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A35C6C07FE;
	Wed, 12 Feb 2020 03:54:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AD87C07FE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 03:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2D8C586D92
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 03:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1R-IBXGkta7T
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 03:54:42 +0000 (UTC)
X-Greylist: delayed 03:39:32 by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5D8CD86D78
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 03:54:42 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 84so525550pfy.6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 19:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=6n20LY7Gbk1vIJ9y2Ek0mCSqczMDBuYCkKoruXym20c=;
 b=qOIuXMr7r5BjTTN+iUHHZHwXO2d7fltI4qfqf6tbvQdh49e6cPRYEmcbGwuGAudwb8
 w30L9oHSj79cz2PbPcfqcB0XK5ilmwynVKV5aJeHITXsOfGQ2xUe9v8aFSP2LLudhaqZ
 5EuvCyJJGJ3MGeULZocj6JU8fEJyVtrln/UygU9d8PPqtZxL46O0XGUSRS+39CSaFCaR
 PhuepTAcAYHA+JKjnq+oXEayOFQCah3uurRAwCjTvqdoLYAUh8wSQQCctFOTihvo8swD
 tQpwBaUvnbY54Av/9UrQQY8UAW1JwMUpiJdvP7Al5IAKyacPUWPBhZ8RkUJSh68erc9A
 ehOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=6n20LY7Gbk1vIJ9y2Ek0mCSqczMDBuYCkKoruXym20c=;
 b=BVoN18+lh6s7z04GQc+TJPlzmJVmO70UMkCamUDdYJgEHqEk3PadtsbyKQzUOAhuGB
 qE6XMMXbrO3PkkTJ5nus1OyT/Usmu01ILTxg84n+PThpvLHSEOCgAaqILVjDgH7S0vyj
 vzh/SGoFPFAa30v+Yyxr+Xw1LjLiDIPb+a19K3xZA+kzF/MjdwIcdAN8TbpO1CDJX5fs
 89bkKASQfc7ztVa4/9/XSdsyryr4Qx5v+GOxJPReyfrM3k4DEpPNxClwJVtIiuXx3PJQ
 o0IOSO/cbMEQgUQox2JSTpcz699gPBCBKbEsjVYzNGg/IJNj8JYNL8HtQymjIZo031mE
 FPQw==
X-Gm-Message-State: APjAAAXMSFHdxBp7mL7Coq7Pe1drxQ3mZvPCWpjI/qrpk7amzPDKRh/s
 y690ujozP8E29j4kgMHKDOeabX9ha1E=
X-Google-Smtp-Source: APXvYqwHXdDGCoJF29xdQdH8f5hJD2lx/3SlqjjMPooqFIPhLc6mldJbeBq8PCoMMtLk5e0pp0EI6A==
X-Received: by 2002:a63:f20a:: with SMTP id v10mr10098705pgh.420.1581479295020; 
 Tue, 11 Feb 2020 19:48:15 -0800 (PST)
Received: from ?IPv6:2601:646:c200:1ef2:d1cf:7a62:c997:6a4b?
 ([2601:646:c200:1ef2:d1cf:7a62:c997:6a4b])
 by smtp.gmail.com with ESMTPSA id 72sm6294836pfw.7.2020.02.11.19.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 19:48:14 -0800 (PST)
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH 00/62] Linux as SEV-ES Guest Support
Date: Tue, 11 Feb 2020 19:48:12 -0800
Message-Id: <BD48E405-8E3F-4EEE-A72A-8A7EDCB6A376@amacapital.net>
References: <20200211135256.24617-1-joro@8bytes.org>
In-Reply-To: <20200211135256.24617-1-joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
X-Mailer: iPhone Mail (17D50)
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Cgo+IE9uIEZlYiAxMSwgMjAyMCwgYXQgNTo1MyBBTSwgSm9lcmcgUm9lZGVsIDxqb3JvQDhieXRl
cy5vcmc+IHdyb3RlOgoKPiAKPiAKPiAgICAqIFB1dHRpbmcgc29tZSBOTUktbG9hZCBvbiB0aGUg
Z3Vlc3Qgd2lsbCBtYWtlIGl0IGNyYXNoIHVzdWFsbHkKPiAgICAgIHdpdGhpbiBhIG1pbnV0ZQoK
U3VwcG9zZSB5b3UgZG8gQ1BVSUQgb3Igc29tZSBNTUlPIGFuZCBnZXQgI1ZDLiBZb3UgZmlsbCBp
biB0aGUgR0hDQiB0byBhc2sgZm9yIGhlbHAuIFNvbWUgdGltZSBiZXR3ZWVuIHdoZW4geW91IHN0
YXJ0IGZpbGxpbmcgaXQgb3V0IGFuZCB3aGVuIHlvdSBkbyBWTUdFWElULCB5b3UgZ2V0IE5NSS4g
SWYgdGhlIE5NSSBkb2VzCml0cyBvd24gR0hDQiBhY2Nlc3MgWzBdLCBpdCB3aWxsIGNsb2JiZXIg
dGhlIG91dGVyICNWQ+KAmWEgc3RhdGUsIHJlc3VsdGluZyBpbiBhIGZhaWx1cmUgd2hlbiBWTUdF
WElUIGhhcHBlbnMuIFRoZXJl4oCZcyBhIHJlbGF0ZWQgZmFpbHVyZSBtb2RlIGlmIHRoZSBOTUkg
aXMgYWZ0ZXIgdGhlIFZNR0VYSVQgYnV0IGJlZm9yZSB0aGUgcmVzdWx0IGlzIHJlYWQuCgpJIHN1
c3BlY3QgeW91IGNhbiBmaXggdGhpcyBieSBzYXZpbmcgdGhlIEdIQ0IgYXQgdGhlIGJlZ2lubmlu
ZyBvZiBkb19ubWkgYW5kIHJlc3RvcmluZyBpdCBhdCB0aGUgZW5kLiBUaGlzIGhhcyB0aGUgbWFq
b3IgY2F2ZWF0IHRoYXQgaXQgd2lsbCBub3Qgd29yayBpZiBkb19ubWkgY29tZXMgZnJvbSB1c2Vy
IG1vZGUgYW5kIHNjaGVkdWxlcywgYnV0IEkgZG9u4oCZdCBiZWxpZXZlIHRoaXMgY2FuIGhhcHBl
bi4KClswXSBEdWUgdG8gdGhlIE5NSV9DT01QTEVURSBjYXRhc3Ryb3BoZSwgdGhlcmUgaXMgYSAx
MDAlIGNoYW5jZSB0aGF0IHRoaXMgaGFwcGVucy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
