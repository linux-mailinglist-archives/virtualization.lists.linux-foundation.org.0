Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 25641526DAA
	for <lists.virtualization@lfdr.de>; Sat, 14 May 2022 02:59:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3583F60B4B;
	Sat, 14 May 2022 00:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSfCGvYhWdPg; Sat, 14 May 2022 00:59:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D4A2160DE5;
	Sat, 14 May 2022 00:59:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 511B8C002D;
	Sat, 14 May 2022 00:59:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FC9CC002D
 for <virtualization@lists.linux-foundation.org>;
 Sat, 14 May 2022 00:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DFD74052B
 for <virtualization@lists.linux-foundation.org>;
 Sat, 14 May 2022 00:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PwtYP5vqxmGE
 for <virtualization@lists.linux-foundation.org>;
 Sat, 14 May 2022 00:59:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 552EA40441
 for <virtualization@lists.linux-foundation.org>;
 Sat, 14 May 2022 00:59:22 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id 31so8940864pgp.8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 May 2022 17:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iIJSWXum182XvEL2ia4jQ4QciU62+avYX3pAPB8sVlc=;
 b=IryO49kj83IsngKODwb2QQE43kbM6CxwrtkR5hv5k75x61n3rnyay1Z8WWQ6mZmlM1
 wHCl8m1PqSne67EvD6W0i75wypL6EPCIXTG2nEUWefDBT0lvrOoJupW/Juqwv+rJ9i0B
 yU4kjssNc5iZQL1eUwTRkGPvIjH/fMU7QHLSPh2IRH0LCmCTZ3WapcSapn2mR7EHT0yt
 VXfmQ4N/OvsJI+cm/9/KFWrp9dQHAMoS7UYWYru106IeCZ1GMnMnXPAo/RQjjbLYgpzx
 9i47IHuP2Znoc4jZgjNAqOZlCGs7miKawn6roR5q2d5yGv+pY+VaUwyE1SHpOeu/S+0/
 mMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iIJSWXum182XvEL2ia4jQ4QciU62+avYX3pAPB8sVlc=;
 b=fP8QMRP8x5REI4GyO76Yvte8gR6cdVo0m8dYrD4nwDyonB/rjyGYkvfctoOq1Y8ydy
 vZ5wOL5FhIM8OsoJF2LVntjR7Dsnr0Ofug856rz/c1JR77gNVZvhQgvskztQr4vExB34
 NY68x+gqKkkkGPb+DMisWFvDUGYLzwDEWjZdWrNGdNPYlEnYX08J+hRgsRQS8l9FDTUF
 mEx5qmx7e0nriXwhAF5wi6sdjFEQLNWZhELsJkKzaocVcOb4HhGcacb5IOIZwhvsNePQ
 lglin1yJzjN9sigVGVB/oc+XEFogGBB/a2EzBzePB8mL63DR7Q3lF4Ya9WoPS0uYh6aA
 tnwA==
X-Gm-Message-State: AOAM5318PV7WBfxgBBQf7wNqnyPztymlKuq9hOaCE0z8bVx8giP6xzRH
 9TPLFYc3oqKYiNfKGMsqbxFpcw==
X-Google-Smtp-Source: ABdhPJyQy0hm4e6qkkbTmYRLJcEYNki8m5v6GckSrokR5ARC1yQJD3M7q2U8kcjyXWa5PpG+NFNn4w==
X-Received: by 2002:a05:6a00:a1e:b0:50d:bb0c:2e27 with SMTP id
 p30-20020a056a000a1e00b0050dbb0c2e27mr6878561pfh.49.1652489961560; 
 Fri, 13 May 2022 17:59:21 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.239])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a170902b21800b0015e8d4eb1dbsm2466125plr.37.2022.05.13.17.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 17:59:20 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Subject: [PATCH v6 1/9] virtio-crypto: header update
Date: Sat, 14 May 2022 08:54:56 +0800
Message-Id: <20220514005504.1042884-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220514005504.1042884-1-pizhenwei@bytedance.com>
References: <20220514005504.1042884-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Cc: helei.sig11@bytedance.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 pizhenwei@bytedance.com, virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org
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

VXBkYXRlIGhlYWRlciBmcm9tIGxpbnV4LCBzdXBwb3J0IGFrY2lwaGVyIHNlcnZpY2UuCgpSZXZp
ZXdlZC1ieTogRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4KUmV2aWV3
ZWQtYnk6IEdvbmdsZWkgPGFyZWkuZ29uZ2xlaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBs
ZWkgaGUgPGhlbGVpLnNpZzExQGJ5dGVkYW5jZS5jb20+ClNpZ25lZC1vZmYtYnk6IHpoZW53ZWkg
cGkgPHBpemhlbndlaUBieXRlZGFuY2UuY29tPgotLS0KIC4uLi9zdGFuZGFyZC1oZWFkZXJzL2xp
bnV4L3ZpcnRpb19jcnlwdG8uaCAgICB8IDgyICsrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9zdGFuZGFyZC1oZWFkZXJzL2xpbnV4L3ZpcnRpb19jcnlwdG8uaCBiL2luY2x1ZGUvc3Rh
bmRhcmQtaGVhZGVycy9saW51eC92aXJ0aW9fY3J5cHRvLmgKaW5kZXggNWZmMGI0ZWU1OS4uNjgw
NjZkYWZiNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9zdGFuZGFyZC1oZWFkZXJzL2xpbnV4L3ZpcnRp
b19jcnlwdG8uaAorKysgYi9pbmNsdWRlL3N0YW5kYXJkLWhlYWRlcnMvbGludXgvdmlydGlvX2Ny
eXB0by5oCkBAIC0zNyw2ICszNyw3IEBACiAjZGVmaW5lIFZJUlRJT19DUllQVE9fU0VSVklDRV9I
QVNIICAgMQogI2RlZmluZSBWSVJUSU9fQ1JZUFRPX1NFUlZJQ0VfTUFDICAgIDIKICNkZWZpbmUg
VklSVElPX0NSWVBUT19TRVJWSUNFX0FFQUQgICAzCisjZGVmaW5lIFZJUlRJT19DUllQVE9fU0VS
VklDRV9BS0NJUEhFUiA0CiAKICNkZWZpbmUgVklSVElPX0NSWVBUT19PUENPREUoc2VydmljZSwg
b3ApICAgKCgoc2VydmljZSkgPDwgOCkgfCAob3ApKQogCkBAIC01Nyw2ICs1OCwxMCBAQCBzdHJ1
Y3QgdmlydGlvX2NyeXB0b19jdHJsX2hlYWRlciB7CiAJICAgVklSVElPX0NSWVBUT19PUENPREUo
VklSVElPX0NSWVBUT19TRVJWSUNFX0FFQUQsIDB4MDIpCiAjZGVmaW5lIFZJUlRJT19DUllQVE9f
QUVBRF9ERVNUUk9ZX1NFU1NJT04gXAogCSAgIFZJUlRJT19DUllQVE9fT1BDT0RFKFZJUlRJT19D
UllQVE9fU0VSVklDRV9BRUFELCAweDAzKQorI2RlZmluZSBWSVJUSU9fQ1JZUFRPX0FLQ0lQSEVS
X0NSRUFURV9TRVNTSU9OIFwKKwkgICBWSVJUSU9fQ1JZUFRPX09QQ09ERShWSVJUSU9fQ1JZUFRP
X1NFUlZJQ0VfQUtDSVBIRVIsIDB4MDQpCisjZGVmaW5lIFZJUlRJT19DUllQVE9fQUtDSVBIRVJf
REVTVFJPWV9TRVNTSU9OIFwKKwkgICBWSVJUSU9fQ1JZUFRPX09QQ09ERShWSVJUSU9fQ1JZUFRP
X1NFUlZJQ0VfQUtDSVBIRVIsIDB4MDUpCiAJdWludDMyX3Qgb3Bjb2RlOwogCXVpbnQzMl90IGFs
Z287CiAJdWludDMyX3QgZmxhZzsKQEAgLTE4MCw2ICsxODUsNTggQEAgc3RydWN0IHZpcnRpb19j
cnlwdG9fYWVhZF9jcmVhdGVfc2Vzc2lvbl9yZXEgewogCXVpbnQ4X3QgcGFkZGluZ1szMl07CiB9
OwogCitzdHJ1Y3QgdmlydGlvX2NyeXB0b19yc2Ffc2Vzc2lvbl9wYXJhIHsKKyNkZWZpbmUgVklS
VElPX0NSWVBUT19SU0FfUkFXX1BBRERJTkcgICAwCisjZGVmaW5lIFZJUlRJT19DUllQVE9fUlNB
X1BLQ1MxX1BBRERJTkcgMQorCXVpbnQzMl90IHBhZGRpbmdfYWxnbzsKKworI2RlZmluZSBWSVJU
SU9fQ1JZUFRPX1JTQV9OT19IQVNIICAgMAorI2RlZmluZSBWSVJUSU9fQ1JZUFRPX1JTQV9NRDIg
ICAgICAgMQorI2RlZmluZSBWSVJUSU9fQ1JZUFRPX1JTQV9NRDMgICAgICAgMgorI2RlZmluZSBW
SVJUSU9fQ1JZUFRPX1JTQV9NRDQgICAgICAgMworI2RlZmluZSBWSVJUSU9fQ1JZUFRPX1JTQV9N
RDUgICAgICAgNAorI2RlZmluZSBWSVJUSU9fQ1JZUFRPX1JTQV9TSEExICAgICAgNQorI2RlZmlu
ZSBWSVJUSU9fQ1JZUFRPX1JTQV9TSEEyNTYgICAgNgorI2RlZmluZSBWSVJUSU9fQ1JZUFRPX1JT
QV9TSEEzODQgICAgNworI2RlZmluZSBWSVJUSU9fQ1JZUFRPX1JTQV9TSEE1MTIgICAgOAorI2Rl
ZmluZSBWSVJUSU9fQ1JZUFRPX1JTQV9TSEEyMjQgICAgOQorCXVpbnQzMl90IGhhc2hfYWxnbzsK
K307CisKK3N0cnVjdCB2aXJ0aW9fY3J5cHRvX2VjZHNhX3Nlc3Npb25fcGFyYSB7CisjZGVmaW5l
IFZJUlRJT19DUllQVE9fQ1VSVkVfVU5LTk9XTiAgIDAKKyNkZWZpbmUgVklSVElPX0NSWVBUT19D
VVJWRV9OSVNUX1AxOTIgMQorI2RlZmluZSBWSVJUSU9fQ1JZUFRPX0NVUlZFX05JU1RfUDIyNCAy
CisjZGVmaW5lIFZJUlRJT19DUllQVE9fQ1VSVkVfTklTVF9QMjU2IDMKKyNkZWZpbmUgVklSVElP
X0NSWVBUT19DVVJWRV9OSVNUX1AzODQgNAorI2RlZmluZSBWSVJUSU9fQ1JZUFRPX0NVUlZFX05J
U1RfUDUyMSA1CisJdWludDMyX3QgY3VydmVfaWQ7CisJdWludDMyX3QgcGFkZGluZzsKK307CisK
K3N0cnVjdCB2aXJ0aW9fY3J5cHRvX2FrY2lwaGVyX3Nlc3Npb25fcGFyYSB7CisjZGVmaW5lIFZJ
UlRJT19DUllQVE9fTk9fQUtDSVBIRVIgICAgMAorI2RlZmluZSBWSVJUSU9fQ1JZUFRPX0FLQ0lQ
SEVSX1JTQSAgIDEKKyNkZWZpbmUgVklSVElPX0NSWVBUT19BS0NJUEhFUl9EU0EgICAyCisjZGVm
aW5lIFZJUlRJT19DUllQVE9fQUtDSVBIRVJfRUNEU0EgMworCXVpbnQzMl90IGFsZ287CisKKyNk
ZWZpbmUgVklSVElPX0NSWVBUT19BS0NJUEhFUl9LRVlfVFlQRV9QVUJMSUMgIDEKKyNkZWZpbmUg
VklSVElPX0NSWVBUT19BS0NJUEhFUl9LRVlfVFlQRV9QUklWQVRFIDIKKwl1aW50MzJfdCBrZXl0
eXBlOworCXVpbnQzMl90IGtleWxlbjsKKworCXVuaW9uIHsKKwkJc3RydWN0IHZpcnRpb19jcnlw
dG9fcnNhX3Nlc3Npb25fcGFyYSByc2E7CisJCXN0cnVjdCB2aXJ0aW9fY3J5cHRvX2VjZHNhX3Nl
c3Npb25fcGFyYSBlY2RzYTsKKwl9IHU7Cit9OworCitzdHJ1Y3QgdmlydGlvX2NyeXB0b19ha2Np
cGhlcl9jcmVhdGVfc2Vzc2lvbl9yZXEgeworCXN0cnVjdCB2aXJ0aW9fY3J5cHRvX2FrY2lwaGVy
X3Nlc3Npb25fcGFyYSBwYXJhOworCXVpbnQ4X3QgcGFkZGluZ1szNl07Cit9OworCiBzdHJ1Y3Qg
dmlydGlvX2NyeXB0b19hbGdfY2hhaW5fc2Vzc2lvbl9wYXJhIHsKICNkZWZpbmUgVklSVElPX0NS
WVBUT19TWU1fQUxHX0NIQUlOX09SREVSX0hBU0hfVEhFTl9DSVBIRVIgIDEKICNkZWZpbmUgVklS
VElPX0NSWVBUT19TWU1fQUxHX0NIQUlOX09SREVSX0NJUEhFUl9USEVOX0hBU0ggIDIKQEAgLTI0
Nyw2ICszMDQsOCBAQCBzdHJ1Y3QgdmlydGlvX2NyeXB0b19vcF9jdHJsX3JlcSB7CiAJCQltYWNf
Y3JlYXRlX3Nlc3Npb247CiAJCXN0cnVjdCB2aXJ0aW9fY3J5cHRvX2FlYWRfY3JlYXRlX3Nlc3Np
b25fcmVxCiAJCQlhZWFkX2NyZWF0ZV9zZXNzaW9uOworCQlzdHJ1Y3QgdmlydGlvX2NyeXB0b19h
a2NpcGhlcl9jcmVhdGVfc2Vzc2lvbl9yZXEKKwkJCWFrY2lwaGVyX2NyZWF0ZV9zZXNzaW9uOwog
CQlzdHJ1Y3QgdmlydGlvX2NyeXB0b19kZXN0cm95X3Nlc3Npb25fcmVxCiAJCQlkZXN0cm95X3Nl
c3Npb247CiAJCXVpbnQ4X3QgcGFkZGluZ1s1Nl07CkBAIC0yNjYsNiArMzI1LDE0IEBAIHN0cnVj
dCB2aXJ0aW9fY3J5cHRvX29wX2hlYWRlciB7CiAJVklSVElPX0NSWVBUT19PUENPREUoVklSVElP
X0NSWVBUT19TRVJWSUNFX0FFQUQsIDB4MDApCiAjZGVmaW5lIFZJUlRJT19DUllQVE9fQUVBRF9E
RUNSWVBUIFwKIAlWSVJUSU9fQ1JZUFRPX09QQ09ERShWSVJUSU9fQ1JZUFRPX1NFUlZJQ0VfQUVB
RCwgMHgwMSkKKyNkZWZpbmUgVklSVElPX0NSWVBUT19BS0NJUEhFUl9FTkNSWVBUIFwKKwlWSVJU
SU9fQ1JZUFRPX09QQ09ERShWSVJUSU9fQ1JZUFRPX1NFUlZJQ0VfQUtDSVBIRVIsIDB4MDApCisj
ZGVmaW5lIFZJUlRJT19DUllQVE9fQUtDSVBIRVJfREVDUllQVCBcCisJVklSVElPX0NSWVBUT19P
UENPREUoVklSVElPX0NSWVBUT19TRVJWSUNFX0FLQ0lQSEVSLCAweDAxKQorI2RlZmluZSBWSVJU
SU9fQ1JZUFRPX0FLQ0lQSEVSX1NJR04gXAorCVZJUlRJT19DUllQVE9fT1BDT0RFKFZJUlRJT19D
UllQVE9fU0VSVklDRV9BS0NJUEhFUiwgMHgwMikKKyNkZWZpbmUgVklSVElPX0NSWVBUT19BS0NJ
UEhFUl9WRVJJRlkgXAorCVZJUlRJT19DUllQVE9fT1BDT0RFKFZJUlRJT19DUllQVE9fU0VSVklD
RV9BS0NJUEhFUiwgMHgwMykKIAl1aW50MzJfdCBvcGNvZGU7CiAJLyogYWxnbyBzaG91bGQgYmUg
c2VydmljZS1zcGVjaWZpYyBhbGdvcml0aG1zICovCiAJdWludDMyX3QgYWxnbzsKQEAgLTM5MCw2
ICs0NTcsMTYgQEAgc3RydWN0IHZpcnRpb19jcnlwdG9fYWVhZF9kYXRhX3JlcSB7CiAJdWludDhf
dCBwYWRkaW5nWzMyXTsKIH07CiAKK3N0cnVjdCB2aXJ0aW9fY3J5cHRvX2FrY2lwaGVyX3BhcmEg
eworCXVpbnQzMl90IHNyY19kYXRhX2xlbjsKKwl1aW50MzJfdCBkc3RfZGF0YV9sZW47Cit9Owor
CitzdHJ1Y3QgdmlydGlvX2NyeXB0b19ha2NpcGhlcl9kYXRhX3JlcSB7CisJc3RydWN0IHZpcnRp
b19jcnlwdG9fYWtjaXBoZXJfcGFyYSBwYXJhOworCXVpbnQ4X3QgcGFkZGluZ1s0MF07Cit9Owor
CiAvKiBUaGUgcmVxdWVzdCBvZiB0aGUgZGF0YSB2aXJ0cXVldWUncyBwYWNrZXQgKi8KIHN0cnVj
dCB2aXJ0aW9fY3J5cHRvX29wX2RhdGFfcmVxIHsKIAlzdHJ1Y3QgdmlydGlvX2NyeXB0b19vcF9o
ZWFkZXIgaGVhZGVyOwpAQCAtMzk5LDYgKzQ3Niw3IEBAIHN0cnVjdCB2aXJ0aW9fY3J5cHRvX29w
X2RhdGFfcmVxIHsKIAkJc3RydWN0IHZpcnRpb19jcnlwdG9faGFzaF9kYXRhX3JlcSBoYXNoX3Jl
cTsKIAkJc3RydWN0IHZpcnRpb19jcnlwdG9fbWFjX2RhdGFfcmVxIG1hY19yZXE7CiAJCXN0cnVj
dCB2aXJ0aW9fY3J5cHRvX2FlYWRfZGF0YV9yZXEgYWVhZF9yZXE7CisJCXN0cnVjdCB2aXJ0aW9f
Y3J5cHRvX2FrY2lwaGVyX2RhdGFfcmVxIGFrY2lwaGVyX3JlcTsKIAkJdWludDhfdCBwYWRkaW5n
WzQ4XTsKIAl9IHU7CiB9OwpAQCAtNDA4LDYgKzQ4Niw4IEBAIHN0cnVjdCB2aXJ0aW9fY3J5cHRv
X29wX2RhdGFfcmVxIHsKICNkZWZpbmUgVklSVElPX0NSWVBUT19CQURNU0cgICAgMgogI2RlZmlu
ZSBWSVJUSU9fQ1JZUFRPX05PVFNVUFAgICAzCiAjZGVmaW5lIFZJUlRJT19DUllQVE9fSU5WU0VT
UyAgIDQgLyogSW52YWxpZCBzZXNzaW9uIGlkICovCisjZGVmaW5lIFZJUlRJT19DUllQVE9fTk9T
UEMgICAgIDUgLyogbm8gZnJlZSBzZXNzaW9uIElEICovCisjZGVmaW5lIFZJUlRJT19DUllQVE9f
S0VZX1JFSkVDVEVEIDYgLyogU2lnbmF0dXJlIHZlcmlmaWNhdGlvbiBmYWlsZWQgKi8KIAogLyog
VGhlIGFjY2VsZXJhdG9yIGhhcmR3YXJlIGlzIHJlYWR5ICovCiAjZGVmaW5lIFZJUlRJT19DUllQ
VE9fU19IV19SRUFEWSAgKDEgPDwgMCkKQEAgLTQzOCw3ICs1MTgsNyBAQCBzdHJ1Y3QgdmlydGlv
X2NyeXB0b19jb25maWcgewogCXVpbnQzMl90IG1heF9jaXBoZXJfa2V5X2xlbjsKIAkvKiBNYXhp
bXVtIGxlbmd0aCBvZiBhdXRoZW50aWNhdGVkIGtleSAqLwogCXVpbnQzMl90IG1heF9hdXRoX2tl
eV9sZW47Ci0JdWludDMyX3QgcmVzZXJ2ZTsKKwl1aW50MzJfdCBha2NpcGhlcl9hbGdvOwogCS8q
IE1heGltdW0gc2l6ZSBvZiBlYWNoIGNyeXB0byByZXF1ZXN0J3MgY29udGVudCAqLwogCXVpbnQ2
NF90IG1heF9zaXplOwogfTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
