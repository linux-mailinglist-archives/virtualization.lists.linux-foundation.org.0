Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBE31766FE
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 23:27:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1C4B781FD3;
	Mon,  2 Mar 2020 22:27:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0-E4x3PwQJRm; Mon,  2 Mar 2020 22:27:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3027F81FB3;
	Mon,  2 Mar 2020 22:27:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19248C07FE;
	Mon,  2 Mar 2020 22:27:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B07BC013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 22:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8A95181D87
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 22:27:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jonAS0cpjvqg
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 22:27:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 54B8A81D08
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 22:27:18 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r17so1856694wrj.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 14:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E9zTLGBNNN54YIhc3c9OPHxiamIGydzptvOB63+Mt8Y=;
 b=IXA238jyUCndn1By49pG/o/5yxGPpqWGW4w3UlkkmdCpder19tHdTWTMWSgB9ZOtmb
 mJuvlzyqEIrHYAGl+SYVtcxaPompCBlppDHpu8CIdOUCWanPAxZdslCtn5e3r1yFqL+F
 9HJykUybQIQL6OEcWQdm7pA3eVKzGG5XIA39o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E9zTLGBNNN54YIhc3c9OPHxiamIGydzptvOB63+Mt8Y=;
 b=Umfq4z721uCc/ZxVUv/P4bI4jaDBWPfxzrp4z2TeVcLnxQffRPQOPdLc/9exjVWgtS
 TO8w9vuVZ+hqaX/Tyl1tbJPdl5LWtdSG04C82RUsXKNLY9/5qIvAHQozwb18ouszQhJ5
 r1IlWZrNFxDFZOLujJVUP/EKIyhhrW/vD3HHaalu6rEoBACq3F99jU7+p7cav1ngYGf6
 6LEQFdAzcQa1KRpYL2BgTQxIYXkokq63eb2uY9aj0a9GqZff2ROjcMgKBpuJzrg7moID
 aKFlPNc48PhwQAprYxvPLbVvg9+8qaRq4ptw6ghZYoHJT6pfPcpKvvakv8lnn7bFGIyj
 l5Yw==
X-Gm-Message-State: ANhLgQ3ULlTtSeMsSN9UdahkGsW7IyD4mEbp6GQfzCqj/Bf5ES7J3Kx8
 VdoxCLo1sF1n8OvDdm+dGxAzNfsRiwo=
X-Google-Smtp-Source: ADFU+vu17V2+hhwNxMgF00S+RXI5Bc+ahqEInf2w5oY4TH3dFIUL5akpZZyS/YXB0wB1Gb4Img+3bg==
X-Received: by 2002:adf:f60b:: with SMTP id t11mr1605591wrp.344.1583188036929; 
 Mon, 02 Mar 2020 14:27:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:16 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 29/51] drm/cirrus: Drop explicit drm_mode_config_cleanup call
Date: Mon,  2 Mar 2020 23:26:09 +0100
Message-Id: <20200302222631.3861340-30-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

V2UgY2FuIGV2ZW4gZGVsZXRlIHRoZSBkcm1fZHJpdmVyLnJlbGVhc2UgaG9vayBub3chCgpUaGlz
IGlzIG1hZGUgcG9zc2libGUgYnkgYSBwcmVjZWVkaW5nIHBhdGNoIHdoaWNoIGFkZGVkIGEgZHJt
bV8KY2xlYW51cCBhY3Rpb24gdG8gZHJtX21vZGVfY29uZmlnX2luaXQoKSwgaGVuY2UgYWxsIHdl
IG5lZWQgdG8gZG8gdG8KZW5zdXJlIHRoYXQgZHJtX21vZGVfY29uZmlnX2NsZWFudXAoKSBpcyBy
dW4gb24gZmluYWwgZHJtX2RldmljZQpjbGVhbnVwIGlzIGNoZWNrIHRoZSBuZXcgZXJyb3IgY29k
ZSBmb3IgX2luaXQoKS4KCnYyOiBFeHBsYWluIHdoeSB0aGlzIGNsZWFudXAgaXMgcG9zc2libGUg
KExhdXJlbnQpLgoKdjM6IFVzZSBkcm1tX21vZGVfY29uZmlnX2luaXQoKSBmb3IgbW9yZSBjbGFy
aXR5IChTYW0sIFRob21hcykKCkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkFj
a2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQu
Y29tPgpDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogdmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vY2lycnVzL2Np
cnJ1cy5jIHwgMjEgKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2NpcnJ1cy9jaXJydXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMKaW5kZXgg
YTlkNzg5YTU2NTM2Li5iZDg3ODRlYTlkNjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9j
aXJydXMvY2lycnVzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYwpAQCAt
NTEwLDExICs1MTAsMTUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVu
Y3MgY2lycnVzX21vZGVfY29uZmlnX2Z1bmNzID0gewogCS5hdG9taWNfY29tbWl0ID0gZHJtX2F0
b21pY19oZWxwZXJfY29tbWl0LAogfTsKIAotc3RhdGljIHZvaWQgY2lycnVzX21vZGVfY29uZmln
X2luaXQoc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cykKK3N0YXRpYyBpbnQgY2lycnVzX21v
ZGVfY29uZmlnX2luaXQoc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cykKIHsKIAlzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2ID0gJmNpcnJ1cy0+ZGV2OworCWludCByZXQ7CisKKwlyZXQgPSBkcm1t
X21vZGVfY29uZmlnX2luaXQoZGV2KTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OwogCi0JZHJt
X21vZGVfY29uZmlnX2luaXQoZGV2KTsKIAlkZXYtPm1vZGVfY29uZmlnLm1pbl93aWR0aCA9IDA7
CiAJZGV2LT5tb2RlX2NvbmZpZy5taW5faGVpZ2h0ID0gMDsKIAlkZXYtPm1vZGVfY29uZmlnLm1h
eF93aWR0aCA9IENJUlJVU19NQVhfUElUQ0ggLyAyOwpAQCAtNTIyLDE1ICs1MjYsMTIgQEAgc3Rh
dGljIHZvaWQgY2lycnVzX21vZGVfY29uZmlnX2luaXQoc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNp
cnJ1cykKIAlkZXYtPm1vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCA9IDE2OwogCWRldi0+bW9k
ZV9jb25maWcucHJlZmVyX3NoYWRvdyA9IDA7CiAJZGV2LT5tb2RlX2NvbmZpZy5mdW5jcyA9ICZj
aXJydXNfbW9kZV9jb25maWdfZnVuY3M7CisKKwlyZXR1cm4gMDsKIH0KIAogLyogLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
ICovCiAKLXN0YXRpYyB2b2lkIGNpcnJ1c19yZWxlYXNlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYp
Ci17Ci0JZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZGV2KTsKLX0KLQogREVGSU5FX0RSTV9HRU1f
Rk9QUyhjaXJydXNfZm9wcyk7CiAKIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBjaXJydXNfZHJp
dmVyID0gewpAQCAtNTQ0LDcgKzU0NSw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBjaXJy
dXNfZHJpdmVyID0gewogCiAJLmZvcHMJCSA9ICZjaXJydXNfZm9wcywKIAlEUk1fR0VNX1NITUVN
X0RSSVZFUl9PUFMsCi0JLnJlbGVhc2UgICAgICAgICA9IGNpcnJ1c19yZWxlYXNlLAogfTsKIAog
c3RhdGljIGludCBjaXJydXNfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LApAQCAtNTkx
LDcgKzU5MSw5IEBAIHN0YXRpYyBpbnQgY2lycnVzX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAq
cGRldiwKIAlpZiAoY2lycnVzLT5tbWlvID09IE5VTEwpCiAJCWdvdG8gZXJyX3VubWFwX3ZyYW07
CiAKLQljaXJydXNfbW9kZV9jb25maWdfaW5pdChjaXJydXMpOworCXJldCA9IGNpcnJ1c19tb2Rl
X2NvbmZpZ19pbml0KGNpcnJ1cyk7CisJaWYgKHJldCkKKwkJZ290byBlcnJfY2xlYW51cDsKIAog
CXJldCA9IGNpcnJ1c19jb25uX2luaXQoY2lycnVzKTsKIAlpZiAocmV0IDwgMCkKQEAgLTYxMyw3
ICs2MTUsNiBAQCBzdGF0aWMgaW50IGNpcnJ1c19wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBk
ZXYsCiAJcmV0dXJuIDA7CiAKIGVycl9jbGVhbnVwOgotCWRybV9tb2RlX2NvbmZpZ19jbGVhbnVw
KGRldik7CiAJaW91bm1hcChjaXJydXMtPm1taW8pOwogZXJyX3VubWFwX3ZyYW06CiAJaW91bm1h
cChjaXJydXMtPnZyYW0pOwotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
