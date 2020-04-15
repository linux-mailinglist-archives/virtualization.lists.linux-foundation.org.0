Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C62E41A9483
	for <lists.virtualization@lfdr.de>; Wed, 15 Apr 2020 09:41:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7BFD986F87;
	Wed, 15 Apr 2020 07:41:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3ZmZZImysoE; Wed, 15 Apr 2020 07:41:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5A4DA86E68;
	Wed, 15 Apr 2020 07:41:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5221EC0172;
	Wed, 15 Apr 2020 07:41:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1068DC0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 07:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EDC6920503
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 07:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uP7gXHyjkNj6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 07:41:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 64119203BE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 07:41:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f13so17851660wrm.13
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 00:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XedkJmxjsSw5iGyEbJMrjH+8XvxXV8jZNQZcH9D7ls4=;
 b=hlBUuEnw0cvcyM55N5GFKDKVz+iuS4rDb0JUNP5hF7k0Y7wzt5kiTqJQGXl9/dbUwV
 PmsBpzrAslauDltt9RncT+iL42zTVBDvLhgh7r1WWFBc1cCdUta5QUTXfhXhHmsLA8Cy
 LQFR2QK8dg0UrplcwHpX77mK6U++eM8/+KWSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XedkJmxjsSw5iGyEbJMrjH+8XvxXV8jZNQZcH9D7ls4=;
 b=a//rWNU7CfjC8ogIeEZDqXqgvR5lAi3tPnGGyxihVOR4V1R6VdB8LZoorSrVl++/Zy
 9fXq0HnSpI1B+ps+g4ye7yD17cMIacmoxFgcyJH1kPrsakFD7vrqg87HMeWzYXRTLFJm
 nOhHhtEoNRMXTepRQ201JymULko0Uz9QwNze9jJlBYi44ax/UY6BCXdPpNIwRM+BBNOr
 xhJU2Cw7pPjmhjRI+BNLJuSf92KB5rX/01U9L2WjPKPGI96FT9ikxhRTovg2MV9x4Qsq
 GosCjz91a61QsRrQ6P/fcGT/shb61ivEKlE0d0yz/l1PL634k6Whyb2A/U4bi5SI3Ny7
 1/ew==
X-Gm-Message-State: AGi0PuZpjzfqMp/tNTr0t+eP47NAKR7zu9Bc3P0jfSrSiQB03A96B1vG
 ODHq3EStYG1tgQhWLsgrrlB47g==
X-Google-Smtp-Source: APiQypImEFWjI/mCGsxrHaTlwwEuBcDEHWeOGY/Vgwm1Ce7LQXsW12usA7t3oLVS57so3p0UqpfgCg==
X-Received: by 2002:a5d:404a:: with SMTP id w10mr1080324wrp.397.1586936478721; 
 Wed, 15 Apr 2020 00:41:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:18 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 36/59] drm/cirrus: Don't use drm_device->dev_private
Date: Wed, 15 Apr 2020 09:40:11 +0200
Message-Id: <20200415074034.175360-37-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Eric Anholt <eric@anholt.net>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
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

VXBjYXN0aW5nIHVzaW5nIGEgY29udGFpbmVyX29mIG1hY3JvIGlzIG1vcmUgdHlwZXNhZmUsIGZh
c3RlciBhbmQKZWFzaWVyIGZvciB0aGUgY29tcGlsZXIgdG8gb3B0aW1pemUuCgpBY2tlZC1ieTog
RXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBpbnRlbC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpDYzogR2Vy
ZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9y
Zz4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IEVyaWMgQW5ob2x0IDxl
cmljQGFuaG9sdC5uZXQ+CkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4KQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCi0tLQogZHJp
dmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYyB8IDkgKysrKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9jaXJydXMvY2lycnVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5j
CmluZGV4IDRiNjU2MzcxNDdiYS4uNzQ0YThlMzM3ZTQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vY2lycnVzL2NpcnJ1cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVz
LmMKQEAgLTU5LDYgKzU5LDggQEAgc3RydWN0IGNpcnJ1c19kZXZpY2UgewogCXZvaWQgX19pb21l
bQkJICAgICAgICptbWlvOwogfTsKIAorI2RlZmluZSB0b19jaXJydXMoX2RldikgY29udGFpbmVy
X29mKF9kZXYsIHN0cnVjdCBjaXJydXNfZGV2aWNlLCBkZXYpCisKIC8qIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAqLwog
LyoKICAqIFRoZSBtZWF0IG9mIHRoaXMgZHJpdmVyLiBUaGUgY29yZSBwYXNzZXMgdXMgYSBtb2Rl
IGFuZCB3ZSBoYXZlIHRvIHByb2dyYW0KQEAgLTMxMSw3ICszMTMsNyBAQCBzdGF0aWMgaW50IGNp
cnJ1c19tb2RlX3NldChzdHJ1Y3QgY2lycnVzX2RldmljZSAqY2lycnVzLAogc3RhdGljIGludCBj
aXJydXNfZmJfYmxpdF9yZWN0KHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLAogCQkJICAgICAg
IHN0cnVjdCBkcm1fcmVjdCAqcmVjdCkKIHsKLQlzdHJ1Y3QgY2lycnVzX2RldmljZSAqY2lycnVz
ID0gZmItPmRldi0+ZGV2X3ByaXZhdGU7CisJc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cyA9
IHRvX2NpcnJ1cyhmYi0+ZGV2KTsKIAl2b2lkICp2bWFwOwogCWludCBpZHgsIHJldDsKIApAQCAt
NDM2LDcgKzQzOCw3IEBAIHN0YXRpYyB2b2lkIGNpcnJ1c19waXBlX2VuYWJsZShzdHJ1Y3QgZHJt
X3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCiAJCQkgICAgICAgc3RydWN0IGRybV9jcnRjX3N0
YXRlICpjcnRjX3N0YXRlLAogCQkJICAgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5l
X3N0YXRlKQogewotCXN0cnVjdCBjaXJydXNfZGV2aWNlICpjaXJydXMgPSBwaXBlLT5jcnRjLmRl
di0+ZGV2X3ByaXZhdGU7CisJc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cyA9IHRvX2NpcnJ1
cyhwaXBlLT5jcnRjLmRldik7CiAKIAljaXJydXNfbW9kZV9zZXQoY2lycnVzLCAmY3J0Y19zdGF0
ZS0+bW9kZSwgcGxhbmVfc3RhdGUtPmZiKTsKIAljaXJydXNfZmJfYmxpdF9mdWxsc2NyZWVuKHBs
YW5lX3N0YXRlLT5mYik7CkBAIC00NDUsNyArNDQ3LDcgQEAgc3RhdGljIHZvaWQgY2lycnVzX3Bp
cGVfZW5hYmxlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKIHN0YXRpYyB2
b2lkIGNpcnJ1c19waXBlX3VwZGF0ZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBp
cGUsCiAJCQkgICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3N0YXRlKQogewotCXN0
cnVjdCBjaXJydXNfZGV2aWNlICpjaXJydXMgPSBwaXBlLT5jcnRjLmRldi0+ZGV2X3ByaXZhdGU7
CisJc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cyA9IHRvX2NpcnJ1cyhwaXBlLT5jcnRjLmRl
dik7CiAJc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUgPSBwaXBlLT5wbGFuZS5zdGF0ZTsK
IAlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSAmcGlwZS0+Y3J0YzsKIAlzdHJ1Y3QgZHJtX3JlY3Qg
cmVjdDsKQEAgLTU3Myw3ICs1NzUsNiBAQCBzdGF0aWMgaW50IGNpcnJ1c19wY2lfcHJvYmUoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYsCiAJCXJldHVybiBQVFJfRVJSKGNpcnJ1cyk7CiAKIAlkZXYgPSAm
Y2lycnVzLT5kZXY7Ci0JZGV2LT5kZXZfcHJpdmF0ZSA9IGNpcnJ1czsKIAogCWNpcnJ1cy0+dnJh
bSA9IGRldm1faW9yZW1hcCgmcGRldi0+ZGV2LCBwY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwgMCks
CiAJCQkJICAgIHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgMCkpOwotLSAKMi4yNS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
