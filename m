Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED331A1DD9
	for <lists.virtualization@lfdr.de>; Wed,  8 Apr 2020 11:06:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 07FC881612;
	Wed,  8 Apr 2020 09:06:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KEXmv0JIwYll; Wed,  8 Apr 2020 09:06:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B36FE87C30;
	Wed,  8 Apr 2020 09:06:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86861C0177;
	Wed,  8 Apr 2020 09:06:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C2B1C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 09:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7ABEF87196
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 09:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZuIfbgw8QGu
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 09:06:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id ECFD087099
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 09:06:11 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id h11so2289079plk.7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 08 Apr 2020 02:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJdq9EhiCdLSVcbOQth7FpH7H9G2yKavu6s15Qit3QU=;
 b=pGPRIxXqDW0B71kbwHpoK6r6GTm7/DGaoOh+DA9IyPOwDyCjrx6yLJYxTeVLL7bAYS
 sM+Ci2a1T2n08H3ESe/4jKedXmpj/ew9kjZSqgB4SLPCFUd0HBVmp73oRRNft/C+0/UJ
 hw+jbp5jPzvmpf2Pfw9X2cvD+dd2sNkmjEFbFU7QchaGW+f5Ft8x0uhD6NxxwCmx+GMu
 bygdlBWJoOMYisJ8xPdbYYjE6AvqpGtZ5jzf2bG42xvLc7JGJsYff1fd5HVuBDhG8r2n
 j2JWIZvhYALMwWHA6Lw8WyZQ+TIZWU7cMY5+V2B3ar1wsOWKRd2d6WN5QUmqYUyWvIwB
 Ad4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AJdq9EhiCdLSVcbOQth7FpH7H9G2yKavu6s15Qit3QU=;
 b=RzZj68cV4yBbL3DqJ8CytdotedddK1fYXnQL/BRFWSvetsGRdzVrM64SmlKP53BbAE
 sjTI1klYaRcvLrVA1zocZT63CBJAhrcmqzjVe93JTy6wRoWUeEU4m6d9RGSSfWlJwxWf
 QKCXBO1RPHrZoIXMiVnBmCa7Aiw39/pT5eBtV6CI0j17uS+f1NU5XC6W+yzoayZWZzcv
 e3iSRmiEvyW3alO+3HwR7CeDFrMKgMzKuGngFRIpjtYothPFiY/1huXWAXEweZW5ZLw/
 hlwOzR4rvj0Y0LiII98sifBMTn22j6ps1dFExWFENYYmRczOXgyFut/gbeIMfW2ZFYyv
 Aa5g==
X-Gm-Message-State: AGi0PubXsm4DH8Ad5IlAvaL1dPVRLHfk1RycQUKeBqvqXS0ROOsqSjWD
 jEJT56c9JG06ymg/dMHPQRo=
X-Google-Smtp-Source: APiQypIgwJsUFP9R6kqPwooPAS+66YkWhw+xW8gcVgHZ8icERZHlHRaZiA0XnJ3yXsENRnZEb5jOdA==
X-Received: by 2002:a17:90a:a40d:: with SMTP id
 y13mr4237829pjp.116.1586336771533; 
 Wed, 08 Apr 2020 02:06:11 -0700 (PDT)
Received: from software.domain.org ([104.207.149.93])
 by smtp.gmail.com with ESMTPSA id t1sm3743315pjf.26.2020.04.08.02.06.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Apr 2020 02:06:11 -0700 (PDT)
From: Huacai Chen <chenhc@lemote.com>
To: Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 3/3] MAINTAINERS: Add myself as fulong2e co-maintainer
Date: Wed,  8 Apr 2020 17:14:10 +0800
Message-Id: <1586337250-25149-3-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1586337250-25149-1-git-send-email-chenhc@lemote.com>
References: <1586337250-25149-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 virtualization@lists.linux-foundation.org, Fuxin Zhang <zhangfx@lemote.com>,
 Huacai Chen <chenhc@lemote.com>, spice-devel@lists.freedesktop.org
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

SSBzdWJtaXR0ZWQgdGhlIE1JUFMvZnVsb25nMmUgc3VwcG9ydCBhYm91dCB0ZW4geWVhcnMgYWdv
LCBhbmQgYWZ0ZXIKdGhhdCBJIGJlY2FtZSBhIE1JUFMga2VybmVsIGRldmVsb3Blci4gTGFzdCB5
ZWFyLCBQaGlsaXBwZSBNYXRoaWV1LQpEYXVkw6kgYXNrZWQgbWUgdGhhdCB3aGV0aGVyIEkgY2Fu
IGJlIGEgcmV2aWV3ZXIgb2YgTUlQUy9mdWxvbmcyZSwgYW5kIEkKcHJvbWlzZWQgdGhhdCBJIHdp
bGwgZG8gc29tZSBRRU1VIHdvcmsgaW4gdGhlIG5leHQgeWVhciAoaS5lLiwgMjAyMCBhbmQKbGF0
ZXIpLiBJIHRoaW5rIG5vdyAoYW5kIGFsc28gaW4gZnV0dXJlKSBJIGNhbiBoYXZlIHNvbWUgc3Bh
cmUgdGltZSwgc28KSSBjYW4gZmluYWxseSBkbyBzb21lIHJlYWwgd29yayBvbiBRRU1VL01JUFMu
IEFuZCBpZiBwb3NzaWJsZSwgSSBob3BlIEkKY2FuIGJlIGEgY28tbWFpbnRhaW5lciBvZiBNSVBT
L2Z1bG9uZzJlLgoKQ2M6IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT4KU2ln
bmVkLW9mZi1ieTogSHVhY2FpIENoZW4gPGNoZW5oY0BsZW1vdGUuY29tPgotLS0KIE1BSU5UQUlO
RVJTIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9N
QUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDY0MmM4ZTAuLjMyODFmZjIgMTAwNjQ0Ci0t
LSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0xMDczLDYgKzEwNzMsNyBAQCBG
OiBody9taXBzL21pcHNfcjRrLmMKIEZ1bG9uZyAyRQogTTogUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgPGY0YnVnQGFtc2F0Lm9yZz4KIE06IEFsZWtzYW5kYXIgTWFya292aWMgPGFsZWtzYW5kYXIu
cWVtdS5kZXZlbEBnbWFpbC5jb20+CitNOiBIdWFjYWkgQ2hlbiA8Y2hlbmhjQGxlbW90ZS5jb20+
CiBTOiBPZGQgRml4ZXMKIEY6IGh3L21pcHMvbWlwc19mdWxvbmcyZS5jCiBGOiBody9pc2EvdnQ4
MmM2ODYuYwotLSAKMi43LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
